import peasy.*;

StackedAutomaton a;
boolean pause = false;
PeasyCam cam;

void setup() {
  size(350, 350, P3D); 
  a = new StackedAutomaton(new Conway(10), 80);
  cam = new PeasyCam(this, a.width/2, a.height/2, a.depth/2, 1000);
  background(0);
}

void draw() {
  background(0);
  if (!pause) a.next();
  a.display();
  cam.rotateY(0.01);
}
void keyPressed() {
  if (key == ' ') pause = !pause;
}
