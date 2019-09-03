ArrayList <Agent> agents;

void setup()
{
  agents = new ArrayList<Agent>();
  fullScreen(P2D); 
  noCursor();
  background(0);
  blendMode(ADD);
  lights();

  for (int i = 0; i < 10000; i++)
  {
    Agent d = new Agent(random(width), random(height));
    d.addForce(PVector.random2D().setMag(0.01));
    agents.add(d);
  }
}

void draw()
{
  background(0);

  for (Agent p : agents)
  {
    p.display();
    p.update();
  }

  if (keyPressed && key == ' ')
  {
    //a.addForce(new PVector(0, 1));
    for (Agent p : agents)
    {
      if (p.pos.x < width/2 && p.pos.y < height/2 ) p.addForce(new PVector(0, 0.09));
      if (p.pos.x < width/2 && p.pos.y >= height/2 ) p.addForce(new PVector(-0.09, 0));
      if (p.pos.x >= width/2 && p.pos.y >= height/2 ) p.addForce(new PVector(0, -0.09));
      if (p.pos.x >= width/2 && p.pos.y < height/2 ) p.addForce(new PVector(-0.09, 0));
    }
  }
}
