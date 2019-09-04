CircleSystem system;

void setup()
{
  fullScreen();
  background(255);
  system = new CircleSystem();
  frameRate(200);
}

void draw()
{
  background(255);
  system.display();
  system.addCircle();
}
