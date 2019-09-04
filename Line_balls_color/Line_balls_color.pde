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
  stroke(0);
  strokeWeight(3);
  line(width/2, height/2, mouseX, mouseY);
  if (mousePressed) {
    bolas.add(new Bola(mouseX, mouseY));
  }
}

void keyPressed() {
  if (key == ' ') {
    PVector centro = new PVector(width / 2, height / 2);
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dif = PVector.sub(mouse, centro);
    dif.div(100);
    for (Bola b : bolas) {
      b.applyForce(dif);
    }
  }
}
