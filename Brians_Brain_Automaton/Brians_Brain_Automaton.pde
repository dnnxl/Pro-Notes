Automaton a;
boolean pause = false;

void setup() {
  size(350, 350, P2D); 
  a = new BriansBrain(5);
  background(0);
}

void draw() {
  background(0);
  //fill(0, 50);
  //rect(0, 0, width, height);
  if (!pause) a.next();
  a.display();
  if (mousePressed) a.click();
}
void keyPressed() {
  if (key == ' ') pause = !pause;
}
