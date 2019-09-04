class Bola {
  PVector pos;
  PVector vel;
  float d;
  color c;

  Bola(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.setMag(random(10));
    d = random(10, 50);
    c = color(random(255), random(255), random(255), 120);
  }
  void display() {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, d, d);
  }
  void update() {
    pos.add(vel);
    if (pos.x >= width - d/2 || pos.x <= d/2) {
      vel.x *= -1;
      pos.x = constrain(pos.x, d/2, width - d/2);
    }    
    if (pos.y >= height - d/2 || pos.y <= d/2) {
      vel.y *= -1;
      pos.y = constrain(pos.y, d/2, height - d/2);
    }
  }
}
