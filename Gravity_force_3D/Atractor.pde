class Atractor extends Agent {
  float g = 1;

  Atractor(float x, float y, float z, float mass) {
    super(x, y, z, mass);
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255);
    sphere(10);
    popMatrix();
  }
  void update() {
  }
  void atract(ArrayList<Agent> agents) {
    for (Agent a : agents) {
      if (this != a) {
        PVector r = PVector.sub(pos, a.pos);
        r.setMag(constrain(r.mag(), 2, 200));
        float d = r.magSq();
        r.normalize();
        r.mult(g * mass * a.mass / d);
        a.addForce(r);
      }
    }
  }
}
