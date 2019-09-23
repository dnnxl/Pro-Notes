enum BorderBehaviour {NO_BORDER, BOUNDS, WRAP}

class Agent {
  PVector pos;
  PVector vel;
  PVector acc;
  float size;
  color c;
  BorderBehaviour border = BorderBehaviour.BOUNDS;
  float maxSpeed;
  
  Agent(float x, float y, float size, color c) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    this.size = size;
    this.c = c;
    maxSpeed = 4;
  }
  Agent(float x, float y, float size) {
    this(x, y, size, color(random(255), random(255), random(255)));
  }
  Agent(float x, float y) {
    this(x, y, 20, color(0, random(255), random(255)));
  }
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
    
    if (border == BorderBehaviour.BOUNDS) {
      if (pos.x < size || pos.x >= width - size) {
        vel.x *= -1;
        pos.x = constrain(pos.x, size, width - size);
      }
      if (pos.y < size || pos.y >= height - size) {
        vel.y *= -1;
        pos.y = constrain(pos.y, size, height - size);
      }
    } else 
    if (border == BorderBehaviour.WRAP) {
      pos.x = (pos.x + width) % width;
      pos.y = (pos.y + height) % height;
    }
    
  }
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(vel.heading());
    noStroke();
    fill(c);
    beginShape();
    vertex(0, -size/3);
    vertex(0, size/3);
    vertex(size, 0);
    endShape(CLOSE);
    popMatrix();
  }
  void addForce(PVector f) {
    acc.add(f);
  }
}
