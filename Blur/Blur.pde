void setup() 
{
  fullScreen();
  background(0);
}

void draw() {
  background(0);
  loadPixels();
  colorMode(HSB);
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float value = noise(x/100.0, y/100.0, frameCount/1000.0);
      pixels[y * width + x] = color(value * (255), 50, 50);
    }
  }
  updatePixels();
}
