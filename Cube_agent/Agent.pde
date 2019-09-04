enum BorderBehaviour {
  NO_BORDER, BOUNDS, WRAP
}

class Agent
{
  PVector pos;
  PVector vel;
  PVector acc;
  float size;
  color c;
  float maxSpeed;
  float angle;
  float boxSize;

  BorderBehaviour border = BorderBehaviour.BOUNDS;

  Agent(float x, float y, float z, float size, color c)
  {
    pos = new PVector(x, y, z);
    vel = new PVector(random(10), random(10), random(10));
    acc = new PVector(0.9, 0.9, 0.9);
    this.size = size;
    this.c = c;
    maxSpeed = 4;
    angle = 0;
  }

  Agent(float x, float y, float z, float size)
  {
    this(x, y, z, size, color(random(255), random(255), random(255), 255));
  }

  Agent(float x, float y, float z)
  {
    this(x, y, z, 10, color(random(255), random(255), random(255), 255));
    boxSize = 800;
  }

  void update()
  {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);

   if (border == BorderBehaviour.BOUNDS)
    {
      if (pos.x >= (((boxSize)/2) -size) || pos.x <= ((-boxSize)/2) - size)
      {
        vel.x *= -1;
        pos.x = constrain(pos.x, ((-boxSize)/2) - size, ((-boxSize)/2 + boxSize)-size);
      }
      if ( pos.y <= ((-boxSize)/2) -size || pos.y >= ((-boxSize)/2 +boxSize) -size)
      {
        vel.y *= -1;
        pos.y = constrain(pos.y, ((-boxSize)/2) -size, ((-boxSize)/2 + boxSize) -size);
      }
      if (pos.z >= (boxSize/2) -size || pos.z <= -(boxSize/2)-size)
      {
        vel.z *= -1;
        pos.z = constrain(pos.z, -(boxSize/2)-size, (boxSize/2) -size);
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
    box(10);
    endShape(CLOSE);
    update();
    popMatrix();
    angle += 0.01;
  }

  void addForce(PVector f)
  {
    acc.add(f);
  }
}
