CircleSystem system;
float angle = 0.02;


void setup()
{
  fullScreen(P3D);
  background(0);
  system = new CircleSystem();
  frameRate(200);
}

void draw()
{
  lights();
  background(0);

  //blendMode(ADD);
  translate(width/2, height/2, 0);
  rotateY(angle);
  rotateX(angle);

  system.display();
  system.addCircle();
  angle += 0.01;
}
