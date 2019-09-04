void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  float x;
  float y;
  float mediaX = width / 2;
  float mediaY = height / 2;
  float desX = 50;
  float desY = 20;
  x = randomGaussian() * desX + mediaX;
  y = randomGaussian() * desY + mediaY;
  stroke(#2C20E5, 50);
  noFill();
  float r = randomGaussian() * 10 + 20;
  ellipse(x, y, r, r);  
}
