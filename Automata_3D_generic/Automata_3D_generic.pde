import peasy.*;

Automaton3D a;
PeasyCam cam;
boolean pause = false;
boolean step = false;

void setup() {
  size(350, 350, P3D); 
  brianish();
  cam = new PeasyCam(this, a.rows * a.w/2, a.cols * a.w/2, a.depth * a.w/2, 1000);
}

void draw() {
  lights();
  background(0);
  if (!pause) a.next();
  else if (step) {
    a.next();
    step = false;
  } else {
    a.display();
  }
  cam.rotateY(0.01);
}

void brianish() {
  a = new Automaton3D(10, 5);
  a.addSurvivalCase(4);
  a.addBirthCase(4);
}
