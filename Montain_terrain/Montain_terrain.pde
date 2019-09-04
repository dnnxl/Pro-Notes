int rows = 50;
int cols = 50;
float size;

float noiseRes = 0.05;
float noiseAmount = 1000;

float noiseOffset = 0;
float noiseSpeed = 0.02;

void setup() {
  fullScreen(P3D, 2);
  background(0);
  size = width / rows;
}

void draw() {
  background(0);
  //fill(#F22EB1);
  noFill();
  //noStroke();
  stroke(255);
  lights();
  translate(0, height * 0.8, 0);
  rotateX(-QUARTER_PI);
  for (int r = 0; r < rows; r++) {
    beginShape(TRIANGLE_STRIP);
    for (int c = 0; c < cols; c++) {
      float y1 = noise(r * noiseRes + noiseOffset, c * noiseRes) * noiseAmount;
      float y2 = noise((r + 1) * noiseRes + noiseOffset, c * noiseRes) * noiseAmount;
      vertex(r * size, y1, -c * size);
      vertex((r + 1) * size, y2, -c * size);
    }
    endShape();
  }
  noiseOffset += noiseSpeed;
}
