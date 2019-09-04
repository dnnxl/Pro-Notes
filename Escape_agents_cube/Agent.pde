enum BorderBehaviour {
  NO_BORDER, BOUNDS, WRAP
}

class Agent
{
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  color c;
  float maxSpeed;
  float angle;
  float boxSize;
  float coef = 0.1;
  PVector friccion;
  float size;

  BorderBehaviour border = BorderBehaviour.NO_BORDER;

  Agent(float x, float y, float z, float mass, color c)
  {
    pos = new PVector(x, y, z);
    vel = PVector.random3D();
    acc = PVector.random3D();
    this.mass = mass;
    this.c = c;
    maxSpeed = 20;
    angle = 0;
    size = mass;
    friccion = vel.copy();
    friccion.normalize();
  }

  Agent(float x, float y, float z, float mass)
  {
    this(x, y, z, mass, color(random(255), random(255), random(255)));
  }

  Agent(float x, float y, float z)
  {
    this(x, y, z, random(10, 90), color(random(255), random(255), random(255)));
    boxSize = 650;
  }

  void update()
  {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
    friccion = vel.copy();
    friccion.normalize();
    if (border == BorderBehaviour.NO_BORDER)
    {
      if (pos.x >= ((boxSize)/2) -size || pos.x < ((-boxSize)/2) + size)
      {
        friccion.mult(-coef);
        addGravity(friccion);
      }
      if ( pos.y < ((-boxSize)/2) +size || pos.y >= ((boxSize)/2) -size)
      {
        friccion.mult(-coef);
        addGravity(friccion);
      }
      if (pos.z >= (boxSize/2) -size || pos.z < (-boxSize/2)+size)
      {
        friccion.mult(-coef);
        addGravity(friccion);
      }
    } else if (border == BorderBehaviour.WRAP)
    {
      pos.x = (pos.x + width) % width;
      pos.y = (pos.y + height) % height;
      pos.z = (pos.z + width) % width;
    }
  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(c);
    box(size);
    endShape(CLOSE);
    update();
    popMatrix();
  }

  void addForce(PVector f)
  {
    vel.add(f);
  }

  void addGravity(PVector f)
  {
    PVector force = PVector.div(f, mass);
    vel.add(force);
  }
}
