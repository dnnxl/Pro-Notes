ArrayList<Agent> agents;
PVector gravity;

void setup() {
  size(800, 800);
  //fullScreen();
  background(0);
  agents = new ArrayList();
  for (int i = 0; i < 1000; i++) {
    Agent a = new Agent(random(width), random(height));
    a.addForce(PVector.random2D().setMag(1));
    agents.add(a);
  }
  gravity = new PVector(0, 0.01);
}

void draw() {
  background(0);
  for (Agent a : agents) {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dif = PVector.sub(mouse, a.pos);
    dif.setMag(map(constrain(dif.mag(), 0, 200), 0, 200, 0.1, 0));
    a.addForce(dif);
    a.addForce(gravity);
    a.display();
    a.update();
  }
}
