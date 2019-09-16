ArrayList<Agent> agents;
ArrayList<Spring> springs;
PVector gravity;

void setup() {
  size(800, 800, P2D);
  background(0);
  gravity = new PVector(0, 50);
  agents = new ArrayList();
  springs = new ArrayList();
  for (float y = 0; y <= height; y += height / 20) {
    int last = agents.size();
    for (float x = 0; x <= width; x += width / 20) {
      Agent a = new Agent(x, y, random(20, 100));
      agents.add(a);
    }
    agents.get(last).fix();
    agents.get(agents.size() - 1).fix();
    for (int i = 1; i < agents.size(); i++) {
      if (agents.get(i).pos.x > agents.get(i - 1).pos.x) {
        Spring s = new Spring(agents.get(i), agents.get(i - 1), 25, 0.5);
        springs.add(s);
      }
    }
  }
}

void draw() {
  background(0);
  for (Agent a : agents) {
    a.addForce(PVector.div(gravity, a.mass));
    a.display();
    a.update();
  }
  for (Spring s : springs) {
    s.display();
    s.update();
  }
  if (keyPressed) {
    PVector f = new PVector(0, 0);
    switch (key) {
    case 'w':
      f = new PVector(0, -10);
      break;
    case 'a':
      f = new PVector(-10, 0);
      break;
    case 's':
      f = new PVector(0, 10);
      break;
    case 'd':
      f = new PVector(10, 0);
      break;
    }
    for (Agent a : agents) a.addForce(f);
  }
}
