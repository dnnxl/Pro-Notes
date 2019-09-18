class Atractor extends Agent {
  float g = 2;

  Atractor(float x, float y, float z, float mass) {
    super(x, y, z, mass, color(#B42121));
  }

  Atractor(float x, float y, float z, float mass, color c) {
    super(x, y, z, mass, c);
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(c);
    sphere(size);
    popMatrix();
  }
  void update() {
  }
  void atract(ArrayList<System> systems) {
    for (System s : systems)
    {
      for (Agent a : s.agents) {
        if (this != a) {
          PVector r = PVector.sub(pos, a.pos);
          r.setMag(constrain(r.mag(), 2, 75));
          float d = r.magSq();
          r.normalize();
          r.mult(g * mass * a.mass / d);
          a.addForce(r);
        }
      }
    }
  }
}
