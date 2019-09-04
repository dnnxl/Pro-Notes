class AgentSystem 
{
  ArrayList<Agent> agents;
  ArrayList<PVector> vectors;
  float size = 10;
  float boxSize;
  float angle;
  PVector gravity;
  PVector upside;

  AgentSystem()
  {
    agents = new ArrayList();
    boxSize = 650;
    gravity = new PVector(0, 0.98, 0);
    upside = new PVector(0, -0.98, 0);
  }

  void addAgent(int mount)
  {
    for (int i = 0; i<mount; i++)
    {
      Agent agent = new Agent(random(-(boxSize)/2, (boxSize)/2), random(-(boxSize)/2, (boxSize)/2), random(-boxSize/2, boxSize/2), random(1, 50));
      agent.addForce(PVector.random3D().setMag(9));
      agents.add(agent);
    }
  }

  void display()
  { 
    stroke(255);
    noFill();
    box(boxSize);
    float force = 0.2;
    for (Agent p : agents)
    {
      if (keyPressed && key == 'w')  p.addGravity(PVector.mult(upside, p.mass));
      if (keyPressed && key == 's')  p.addGravity(PVector.mult(gravity, p.mass));
      if (keyPressed && key == 'a')  p.addForce(PVector.mult(new PVector(-force, 0, 0), p.mass));
      if (keyPressed && key == 'd')  p.addForce(PVector.mult(new PVector(force, 0, 0), p.mass));
      if (keyPressed && key == 'f')  p.addForce(PVector.mult(new PVector(0, 0, force), p.mass));
      if (keyPressed && key == 'r')  p.addForce(PVector.mult(new PVector(0, 0, -force), p.mass));
      p.display();
      p.update();
      applyForce(p);
    }
  }

  void applyForce(Agent p)
  {
    float velocity = 0.2;

    if (p.pos.x > (((boxSize)/2) -size))
    {
      p.addForce(new PVector(-velocity, 0, 0));
    }
    if (p.pos.x < ((-boxSize)/2) + size)
    {
      p.addForce(new PVector(velocity, 0, 0));
    }
    if ( p.pos.y < ((-boxSize)/2) + size)
    {
      p.addForce(new PVector(0, velocity, 0));
    }
    if (p.pos.y > ((boxSize)/2) -size)
    {
      p.addForce(new PVector(0, -velocity, 0));
    }
    if (p.pos.z > (boxSize/2) -size)
    {
      p.addForce(new PVector(0, 0, -velocity));
    }
    if (p.pos.z < -(boxSize/2) + size)
    {
      p.addForce(new PVector(0, 0, velocity));
    }
  }
}
