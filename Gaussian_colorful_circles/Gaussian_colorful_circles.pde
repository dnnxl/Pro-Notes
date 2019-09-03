void setup()
{
  fullScreen();
  background(255);
}

void draw()
{
  float x = width/2;
  float y = height/2;
  float media = width/2;
  float mediay = height/2;
  float desviacion = 1000;
  float desviaciony = 962;
  
  x = randomGaussian() * desviacion + media;
  noStroke();
  fill(#741599, 81);
  y = randomGaussian() * desviaciony + mediay;
  
  int r = (int)randomGaussian() * 6 + 20;
  ellipse(x, y, r, r);
}
