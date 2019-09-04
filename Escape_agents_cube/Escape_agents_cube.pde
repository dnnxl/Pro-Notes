AgentSystem agents;
float angle = 0.02 ;
PVector gravity;
PVector upside;

void setup()
{
  fullScreen(P3D); 
  noCursor();
  background(0);
  blendMode(BLEND);
  lights();
  agents = new AgentSystem();
  agents.addAgent(100);
}

void draw()
{
  lights();

  background(0);

  pushMatrix();
  translate(width/2, height/2, 0);
  //rotateX(angle);
  //rotateY(angle);
  //rotateZ(angle);

  agents.display();
  popMatrix();

  angle += 0.0051;
}
