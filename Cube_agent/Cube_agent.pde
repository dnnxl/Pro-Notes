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
  gravity = new PVector(0, 0.75);
  upside = new PVector(-0, -0.75);
  agents.addAgent(10000);
}

void draw()
{
  background(0);

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(angle);
  rotateY(angle);
  rotateZ(angle);

  agents.display();
  agents.applyForce();
  popMatrix();

  if (keyPressed && key == ' ')
  {
    agents.addGravity(PVector.mult(gravity, agents.size));
  }
  if (keyPressed && key == 'W' || key == 'w')
  {
    agents.addGravity(PVector.mult(upside, agents.size));
  }
  angle += 0.011;
}
