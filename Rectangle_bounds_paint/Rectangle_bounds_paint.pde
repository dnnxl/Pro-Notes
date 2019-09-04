float x;
float xInc = 10;
float y;
float yInc = 5;
float d = 100;
color c;

void setup() {
  size(1000, 1000);
  x = width / 2;
  y = height / 2;
  c = #E8078E;
}

void draw() {
  //background(#23E880);
  colorMode(RGB);
  stroke(255, 255, 0);
  strokeWeight(6.6);
  fill(c);
  rectMode(CENTER);
  rect(x, y, d, d);
  if (x >= width - d/2 || x <= d/2) xInc *= -1;
  if (y >= height - d/2 || y <= d/2) yInc *= -1;
  x += xInc;
  y += yInc;
  stroke(0, 0, 255);
  strokeWeight(2);
  line(0, 0, x, y);
  line(width, 0, x, y);
  line(0, height, x, y);
  line(width, height, x, y);
  
  d = map(mouseY, 0, height, 10, 200);
  colorMode(HSB);
  c = color(map(mouseX, 0, width, 0, 255), 255, 255);
}