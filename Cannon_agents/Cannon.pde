import java.util.Iterator;

class Cannon
{
  PVector pos;
  ArrayList<Agent> agents;
  float angle;
  PVector dir;
  float impulse;
  PVector gravity;
  float friction;
  float drag; 
  PVector floatForce;

  Cannon(float x, float y)
  {
    pos = new PVector(x, y);
    agents = new ArrayList();
    dir = new PVector(0, -1);
    impulse = 100;
    gravity = new PVector(0, 9);
    friction = 0.01;
    drag = 1;
    floatForce = new PVector(0, -1.1);
  }

  void update()
  {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(pos);
    mouse.normalize();
    dir.x = mouse.x;
    dir.y = mouse.y;

    Iterator<Agent> it = agents.iterator();
    while (it.hasNext())
    {
      Agent a = it.next();

      a.applyForce(PVector.div(gravity, a.mass));
      if (a.pos.y < pos.y) {
      } else
      {
        a.applyForce(floatForce);

        applyDrag(a);
      }
      a.update();

      if (a.isDead())
      {
        it.remove();
      }
    }
  }


  void display()
  {
    for (Agent a : agents) 
      a.display();
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(pos.x, pos.y, 30, 30);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(dir.heading());
    stroke(255);
    strokeWeight(50);
    line(0, 0, 30, 0);
    popMatrix();
    rectMode(CORNER);
    noStroke();
    fill(#F50000, 100);
    rect(0, pos.y, width, height - pos.y);
  }


  void shoot()
  {
    Agent a = new Agent(pos.x, pos.y); 
    PVector f = dir.copy();
    f.setMag(impulse);

    a.applyForce(f);
    agents.add(a);
  }


  void applyFriction(Agent a)
  {
    PVector f = a.vel.copy();
    f.normalize();
    f.mult(-friction);
    a.applyForce(f);
  }


  void applyDrag(Agent a)
  {
    PVector d = a.vel.copy();
    float mag2 = d.magSq();
    d.normalize();
    d.mult(-drag/2 * mag2);
    a.applyForce(d);
  }
}
