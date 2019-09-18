import controlP5.*;
ControlP5 cp5;
ArrayList<Agent> agents;
ArrayList<ArrayList<Agent>> listagents;
ArrayList<Spring> springs;
PVector gravity;
float friction = 0.1;
float restLenght = 60;
float k = 0.05;

void setup() {
  listagents = new ArrayList();
  initControls();

  //float 
  fullScreen(P3D);
  background(0);
  gravity = new PVector(0, 0.6, 0);
  agents = new ArrayList();
  springs = new ArrayList();
  for (float y = 200; y <= height-250; y += height / 20) {
    int last = agents.size();
    for (float x = 200; x <= width-250; x += width / 20) {
      Agent a = new Agent(x, 100, -y, 2, color(#2CAD4A));
      agents.add(a);
    }
    listagents.add(agents);
    agents = new ArrayList();
    int size =listagents.size()-1;

    for (int j = 0; j < listagents.size()-1; j++) {
      for (int i = 1; i < listagents.get(0).size()-1; i++) {
        if (listagents.get(j).get(i).pos.x >listagents.get(j).get(i - 1).pos.x) {
          Spring s = new Spring(listagents.get(j).get(i), listagents.get(j).get(i - 1), restLenght, restLenght);
          springs.add(s);
          Spring a = new Spring(listagents.get(j+1).get(i), listagents.get(j).get(i), restLenght, k);
          springs.add(a);
        }
      }
    }

    int sizep =listagents.size()-1;
    for (int l = 1; l < listagents.get(0).size(); l++) {
      if (listagents.get(sizep).get(l).pos.x >listagents.get(sizep).get(l - 1).pos.x) {
        Spring sa= new Spring(listagents.get(sizep).get(l), listagents.get(sizep).get(l - 1), restLenght, k);
        springs.add(sa);
      }
    }

    for (int p = 0; p < listagents.size()-1; p++) {
      Spring saa = new Spring(listagents.get(p).get(0), listagents.get(p+1).get(0), restLenght, k);
      springs.add(saa);
    }

    for (int k = 0; k < listagents.size()-1; k++) {
      Spring saaa = new Spring(listagents.get(k).get(listagents.get(k).size()-1), listagents.get(k+1).get(listagents.get(k).size()-1), restLenght, k);
      springs.add(saaa);
    }
  }
  listagents.get(0).get(0).fix(); // primer
  listagents.get(0).get(listagents.get(0).size() - 1).fix(); // ultimo de la fila
  listagents.get(listagents.size()-1).get(0).fix(); // ultimo de la fila
  listagents.get(listagents.size()-1).get(listagents.get(0).size() - 1).fix(); // ultimo w
}
void draw() {
  background(0);



  for (ArrayList<Agent> an : listagents) {
    for (Agent a : an) {
      a.friction = friction;
      a.addForce(PVector.div(gravity, a.mass));
      a.display();
      a.update();
    }
  }
  for (Spring s : springs) {
    s.k = k;
    s.restLength= restLenght;
    s.display();
    s.update();
  }
  if (keyPressed) {
    PVector f = new PVector(0, 0);
    switch (key) {
    case 'w':
      f = new PVector(0, -2);
      break;
    case 'a':
      f = new PVector(-2, 0);
      break;
    case 's':
      f = new PVector(0, 2);
      break;
    case 'd':
      f = new PVector(2, 0);
      break;
    }
    for (ArrayList<Agent> an : listagents) {
      for (Agent a : an) {
        a.addForce(f);
      }
    }
  }
}
void initControls() {
  cp5 = new ControlP5(this);
  cp5.addSlider("friction")
    .setPosition(10, 10)
    .setSize(200, 20)
    .setRange(0, 10);
  cp5.addSlider("k")
    .setPosition(10, 35)
    .setSize(200, 20)
    .setRange(0, 1);
  cp5.addSlider("restLenght")
    .setPosition(10, 60)
    .setSize(200, 20)
    .setRange(0.01, 60);
}
