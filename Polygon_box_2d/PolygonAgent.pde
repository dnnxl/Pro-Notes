class PolygonAgent {
  Body body;
  ArrayList<Vec2> vertices;
  color c;
  
  PolygonAgent() {}
  PolygonAgent(float x, float y) {
    vertices = new ArrayList();
    vertices.add(new Vec2(0, random(-10, -30)));
    vertices.add(new Vec2(random(5, 20), 0));
    vertices.add(new Vec2(random(4, 10), random(10, 30)));
    vertices.add(new Vec2(random(-20, 5), random(10, 30)));
    vertices.add(new Vec2(random(-20, 5), 0));
    makeBody(x, y);
    colorMode(HSB);
    c = color(frameCount % 255, 255, 255);
    colorMode(RGB);
  }
  void makeBody(float x, float y) {
    BodyDef bodyDef = new BodyDef();
    bodyDef.setPosition(box2d.coordPixelsToWorld(x, y));
    bodyDef.setType(BodyType.DYNAMIC);
    bodyDef.setAngle(random(PI));
    body = box2d.createBody(bodyDef);
    
    PolygonShape polygonShape = new PolygonShape();
    Vec2[] worldVertices = new Vec2[vertices.size()];
    for (int i = 0; i < vertices.size(); i++) {
      worldVertices[i] = box2d.vectorPixelsToWorld(vertices.get(i));      
    }
    polygonShape.set(worldVertices, worldVertices.length);
    
    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.setShape(polygonShape);
    fixtureDef.setDensity(1);
    fixtureDef.setRestitution(0.1);
    fixtureDef.setFriction(0);
    
    body.createFixture(fixtureDef);
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-TWO_PI, TWO_PI));
  }
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    PolygonShape ps = (PolygonShape) body.getFixtureList().getShape();
    float ang = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-ang);
    fill(c);
    noStroke();
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  void killBody() {
    box2d.destroyBody(body);
  }
  boolean isDead() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height + 50) {
      killBody();
      return true;
    }
    return false;
  }
}
