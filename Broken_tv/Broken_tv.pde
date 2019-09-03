void setup()
{
  fullScreen();
  background(0);
}

void draw()
{
  background(0);
  loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      float value = random(255);
      pixels[y* width +x] = color(value); // width cantidad de columnas
    }
  }
  updatePixels();
}
