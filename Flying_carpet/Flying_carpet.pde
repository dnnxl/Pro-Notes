// Name of art work:  Pizza carpet movement
// Author: Danny Xie Li
// Using perlin noise sample

int rows = 50;
int cols = 50;
float size;
float noiseR;
float noiseA = 800;
float noiseOFF = 0;
float noiseSpeed = 0.009;
float heightLevel;
ArrayList<Carpet> listCarpets;

void setup() 
{
  size(800, 800, P3D);
  background(0);
  size = width/rows;
  listCarpets = new ArrayList<Carpet>();
  float off = 0.1;
  for (int i = 0; i < 10; i++)
  {
    Carpet carpet = new Carpet(color(random(255), random(255), random(255)), size, 10+off);
    listCarpets.add(carpet);
    off = off + 0.1;
  }
}

void draw()
{
  heightLevel = (noise(51*noiseR, -311*noiseR+noiseOFF, 10) *height);
  background(0);
  noStroke();
  lights();
  rotateX(-TAU);

  for (Carpet c : listCarpets)
  {
    c.update(heightLevel, noiseOFF);
    c.display();
    delay(3);
  }
  noiseOFF += noiseSpeed;
}
