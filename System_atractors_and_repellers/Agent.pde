enum BorderBehaviour {NO_BORDER, BOUNDS, WRAP}

class Agent {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  float size;
  color c;
  BorderBehaviour border = BorderBehaviour.NO_BORDER;
  float maxSpeed;
  
  Agent(float x, float y, float z, float mass, color c) {
    pos = new PVector(x, y, z);
    vel = PVector.random3D().setMag(0.5);
    acc = PVector.random3D();
    this.mass = mass;
    this.c = c;
    maxSpeed = 10000;
    size = sqrt(mass/2);
  }
  Agent(float x, float y, float z, float mass) {
    this(x, y, z, mass, color(random(255), random(255), random(255)));
  }
  Agent(float x, float y, float z) {
    this(x, y, z, random(10,50), color(random(255), random(255), random(255), random(255)));
  }
  void update() {
    vel.add(acc);
    pos.add(vel);
    vel.limit(maxSpeed);
    acc.mult(0);
    mass -= 0.1; 
    
    if (border == BorderBehaviour.BOUNDS) {
      if (pos.x < size || pos.x >= width - size) {
        vel.x *= -1;
        pos.x = constrain(pos.x, size, width - size);
      }
      if (pos.y < size || pos.y >= height - size) {
        vel.y *= -1;
        pos.y = constrain(pos.y, size, height - size);
      }
      if (pos.z < size || pos.z >= width - size) {
        vel.z *= -1;
        pos.z = constrain(pos.z, size, width - size);
      }
    } else 
    if (border == BorderBehaviour.WRAP) {
      pos.x = (pos.x + width) % width;
      pos.y = (pos.y + height) % height;
      pos.z = (pos.z + width) % width;
    }
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(c);
    box(size);
    popMatrix();
  }
  void addForce(PVector f) {
    PVector force = PVector.div(f, mass);
    acc.add(force);
  }
  
  boolean isDead()
  {
   if(mass <= 0)
   {
    return true; 
   }
   else
   {
     return false;
   }
   
  }
}
