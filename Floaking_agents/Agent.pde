enum BorderBehaviour {
  NO_BORDER, BOUNDS, WRAP
}

class Agent {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  color c;
  BorderBehaviour border = BorderBehaviour.WRAP;
  float maxSpeed;
  boolean fixed;
  float friction;
  float arrivalDist;
  
  float sepDist = 50;
  float sepRatio = 3;
  float alignDist = 75;
  float alignRatio = 1;
  float cohDist = 100;
  float cohRatio = 0.5;
  
  Agent(float x, float y, float mass, color c) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    this.mass = mass;
    this.c = c;
    maxSpeed = 5;
    fixed = false;
    friction = 0.1;
    arrivalDist = 400;
  }
  Agent(float x, float y, float mass) {
    this(x, y, mass, color(random(255), random(255), random(255)));
  }
  Agent(float x, float y) {
    this(x, y, 20, color(0, random(255), random(255)));
  }
  void applyFriction() {
    PVector fric = vel.copy();
    fric.normalize();
    fric.mult(-friction);
    addForce(fric);
  }
  void update() {
    if (!fixed) {
      applyFriction();
      vel.add(acc);
      pos.add(vel);
      vel.limit(maxSpeed);
      acc.mult(0);

      if (border == BorderBehaviour.BOUNDS) {
        if (pos.x < mass || pos.x >= width - mass) {
          vel.x *= -1;
          pos.x = constrain(pos.x, mass, width - mass);
        }
        if (pos.y < mass || pos.y >= height - mass) {
          vel.y *= -1;
          pos.y = constrain(pos.y, mass, height - mass);
        }
      } else 
      if (border == BorderBehaviour.WRAP) {
        pos.x = (pos.x + width) % width;
        pos.y = (pos.y + height) % height;
      }
    }
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(vel.heading());
    noStroke();
    fill(c);
    //ellipse(0, 0, sqrt(mass) * 2, sqrt(mass) * 2);
    beginShape();
    vertex(0, -mass/3);
    vertex(0, mass/3);
    vertex(mass, 0);
    endShape(CLOSE);
    popMatrix();
  }
  void addForce(PVector f) {
    PVector force = PVector.div(f, mass);
    force.limit(maxSpeed);
    acc.add(force);
  }
  void fix() {
    fixed = true;
  }
  void unfix() {
    fixed = false;
  }
  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    float d = PVector.dist(pos, target);
    d = constrain(d, 0, arrivalDist);
    float speed = map(d, 0, arrivalDist, 0, maxSpeed);
    vel.limit(speed);
    PVector steering = PVector.sub(desired, vel);
    steering.limit(maxSpeed);
    addForce(steering);
  }
  void align(ArrayList<Agent> agents) {
    int n = 0;
    PVector alignForce = new PVector(0, 0);
    for (Agent a : agents) {
      float dist = PVector.dist(pos, a.pos);
      if (a != this && dist <= alignDist) {
        alignForce.add(a.vel);
        n++;
      }
    }
    if (n > 0) alignForce.div(n);
    alignForce.mult(alignRatio);
    addForce(alignForce);
  }
  void separate(ArrayList<Agent> agents) {
    int n = 0;
    PVector sepForce = new PVector(0, 0);
    for (Agent a : agents) {
      float dist = PVector.dist(pos, a.pos);
      if (a != this && dist <= sepDist) {
        PVector dif = PVector.sub(pos, a.pos);
        float newMag = map(dif.mag(), 0, sepDist, sepDist, 0);
        dif.setMag(newMag);
        sepForce.add(dif);
        n++;
      }
    }
    if (n > 0) sepForce.div(n);
    sepForce.mult(sepRatio);
    addForce(sepForce);
  }
  void cohere(ArrayList<Agent> agents) {
    int n = 0;
    PVector cohForce = new PVector(0, 0);
    for (Agent a : agents) {
      float dist = PVector.dist(pos, a.pos);
      if(a != this && dist <= cohDist) {
        cohForce.add(a.pos);
        n++;
      }
    }
    if (n > 0) cohForce.div(n);
    cohForce.sub(pos);
    cohForce.mult(cohRatio);
    addForce(cohForce);
  }
}
