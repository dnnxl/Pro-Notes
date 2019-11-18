Wolfram w;

void setup() {
  size(350, 350, P2D); 
  background(255);
  w = new Wolfram(256, 30);
}

void draw() {
  w.display();
  w.next();
}

void keyPressed() {
  if (key == '\n') {
    w.increaseRuleset();
  }
}
