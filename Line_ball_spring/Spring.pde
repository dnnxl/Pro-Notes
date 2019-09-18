class Spring {
  float restLength;
  float k;
  Agent a1;
  Agent a2;
  
  Spring(Agent a1, Agent a2, float restLength, float k) {
    this.a1 = a1;
    this.a2 = a2;
    this.restLength = restLength;
    this.k = k;
  }
  void update() {
    PVector springForce = PVector.sub(a2.pos, a1.pos);
    float len = springForce.mag();
    springForce.normalize();
    float displacement = len - restLength;
    springForce.mult(-k * displacement);
    a2.addForce(springForce);
    springForce.mult(-1);
    a1.addForce(springForce);
  }
  void display() {
    stroke(255);
    strokeWeight(1);
    line(a1.pos.x, a1.pos.y, a1.pos.z, a2.pos.x, a2.pos.y,  a2.pos.z);
  }
}
