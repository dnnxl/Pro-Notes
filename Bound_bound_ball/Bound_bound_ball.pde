ArrayList<Bola> bolas;

void setup() {
  size(1000, 1000);
  bolas = new ArrayList();
}

void draw() {
  background(255);
  for (Bola b : bolas) {
    b.display();
    b.update();
  }
  if (mousePressed) {
    bolas.add(new Bola(mouseX, mouseY));
  }
}
