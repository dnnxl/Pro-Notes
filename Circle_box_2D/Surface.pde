class Surface {
  ArrayList<Vec2> points;
  
  Surface() {
    points = new ArrayList();
    makeBody();
  }
  void makeBody() {
    BodyDef bodyDef = new BodyDef();
    bodyDef.setPosition(new Vec2(0, 0));
    
    Body body = box2d.createBody(bodyDef);
    float offset = random(100);
    for (float x = 0; x < width; x += 5) {
      float y = noise(offset) * 200 + height / 3;
      points.add(new Vec2(x, y));
      offset += 0.03;
    }
    
    Vec2[] worldPoints = new Vec2[points.size()];
    for (int i = 0; i < points.size(); i++) {
      worldPoints[i] = box2d.coordPixelsToWorld(points.get(i));
    }
    ChainShape chainShape = new ChainShape();
    chainShape.createChain(worldPoints, worldPoints.length);
    
    body.createFixture(chainShape, 1);
  }
  void display() {
    strokeWeight(3);
    stroke(255);
    for (int i = 0; i < points.size() - 1; i++) {
      Vec2 a = points.get(i);
      Vec2 b = points.get(i + 1);
      line(a.x, a.y, b.x, b.y);
    }    
  }
}
