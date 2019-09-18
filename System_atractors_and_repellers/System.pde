class System 
{
  ArrayList<Agent> agents;
  PVector position;

  PVector gravity;
  float boxSize;
  float angle;

  System()
  {
    agents = new ArrayList();
    boxSize = 800;
    position = new PVector(random(-boxSize/2, boxSize/2), random(-boxSize/2, boxSize/2), random(-boxSize/2, boxSize/2));// Tamaño del cubo
    gravity = new PVector(0, 0);
  }

  void addAgent()
  {
    Agent agent = new Agent(position.x, position.y, position.z);
    agent.addForce(PVector.random3D().setMag(2));
    agents.add(agent);
  }

  void update()
  {
    Iterator<Agent> it = agents.iterator();
    while (it.hasNext())
    {
      Agent agent = it.next();
      agent.update();
      agent.addForce(PVector.div(gravity, agent.mass));
      boolean value = agent.isDead();
      if (value)
      {
        it.remove();
      }
    }
  }

  void display()
  { 
    stroke(255);
    noFill();
    for (Agent p : agents)
    {
      p.display();
    }
    angle += 0.01;
  }
}
