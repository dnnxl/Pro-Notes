class AgentSystem 
{
  ArrayList<Agent> agents;
  ArrayList<PVector> vectors;
  float size = 10;
  float boxSide;
  float angle;

  AgentSystem()
  {
    agents = new ArrayList();
    boxSide = 800;
  }

  void addAgent(int mount)
  {
    for (int i = 0; i<mount; i++)
    {
      Agent agent = new Agent(random(-(width)/2, (width)/2), random(-(height)/2, (height)/2), random(-width/2, width/2));
      agent.addForce(PVector.random2D().setMag(2));
      agents.add(agent);
    }
  }

  void display()
  { 
    stroke(255);
    noFill();
    box(boxSide);
    for (Agent p : agents)
    {
      p.display();
    }
    angle += 0.01;
  }

  void applyForce()
  {
    float velocity = 0.12;
    for (Agent p : agents)
    {
      // arriba, derecha, frente
      if (p.pos.x >= 0 && p.pos.y < 0 && p.pos.z >= 0) {
        p.addForce(new PVector(0, 0, -velocity));
      }
      //arriba, derecha, atrás
      if (p.pos.x >= 0 && p.pos.y < 0 && p.pos.z < 0) {
        p.addForce(new PVector(0, velocity, 0));
      }
      //abajo, derecha, frente
      if (p.pos.x > 0 && p.pos.y > 0 && p.pos.z >= -0) {
        p.addForce(new PVector(0, -velocity, 0));
      }
      //abajo, derecha, atrás
      if (p.pos.x > 0 && p.pos.y > 0 && p.pos.z < -0) {
        p.addForce(new PVector(-velocity, 0, 0));
      }
      //abajo, izquierda,frente
      if (p.pos.x < 0 && p.pos.y >= 0 && p.pos.z >= 0) { 
        p.addForce(new PVector(velocity, 0, 0));
      }
      //abajo, izquierda, atrás
      if (p.pos.x < 0 && p.pos.y >= 0 && p.pos.z < -0) {
        p.addForce(new PVector(0, -velocity, 0));
      }
      //arriba, izquierda,frente
      if (p.pos.x <= 0 && p.pos.y < 0 && p.pos.z >= -0) { 
        p.addForce(new PVector(0, velocity, 0));
      }      
      //arriba, izquierda, atrás
      if (p.pos.x <= 0 && p.pos.y < 0 && p.pos.z < -0) {
        p.addForce(new PVector(0, 0, velocity));
      }
    }
  }
  void addGravity(PVector force)
  {
    for (Agent p : agents)
    {
      p.addForce(force);
    }
  }
}
