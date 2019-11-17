class Agent {
  float x;
  float y;
  float w;
  float h;
  Body body;
  BodyType type;
  color c;
  
  Agent() {}
  Agent(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.h = 0;
    this.w = w;
    type = BodyType.DYNAMIC;
    c = color(random(128, 255), random(255), random(255));
    createBody();
  }
  void createBody() {
    BodyDef bodyDef = new BodyDef();
    bodyDef.type = type;
    bodyDef.setPosition(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bodyDef);
    
    //PolygonShape shape = new PolygonShape();
    //float w2d = box2d.scalarPixelsToWorld(w / 2);
    //float h2d = box2d.scalarPixelsToWorld(h / 2);
    //shape.setAsBox(w2d, h2d);
    CircleShape shape = new CircleShape();
    shape.setRadius(box2d.scalarPixelsToWorld(w / 2));
    
    FixtureDef fixtureDef = new FixtureDef();
    fixtureDef.shape = shape;
    fixtureDef.density = 0.1;
    fixtureDef.friction = 0.0;
    fixtureDef.restitution = 0.1;
    
    body.createFixture(fixtureDef);
  }
  void display() {
    fill(c);
    stroke(255);
    rectMode(CENTER);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float ang = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-ang);
    //rect(0, 0, w, h);
    ellipse(0, 0, w, w);
    popMatrix();
  }
  void killBody() {
    box2d.destroyBody(body);
  }
  boolean isDead() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height + w) {
      killBody();
      return true;
    }
    return false;
  }
}
