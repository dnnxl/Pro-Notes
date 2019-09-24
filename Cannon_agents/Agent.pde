class Agent
{
 PVector pos;
 PVector vel;
 PVector acc;
 float mass;
 float maxSpeed;
 color c;
 float angle;
 float rotVel;
 
 Agent(float x, float y)
 {
  pos = new PVector(x, y);
  vel = new PVector(0, 0);
  acc = new PVector(0, 0);
  mass = randomGaussian() * 10;
  maxSpeed = 1000;
  colorMode(HSB);
  c= color(frameCount % 255, 255, 255);
  colorMode(RGB);
  angle = random(PI);
  rotVel = randomGaussian() * 0.1;
   
 }
  
  void update()
  {
   vel.add(acc);
   pos.add(vel);
   vel.limit(maxSpeed);
   acc.mult(0);
   angle += rotVel;
  }
  
  void display()
  {
   pushMatrix();
   translate(pos.x, pos.y);
   rotate(angle);
   noStroke();
   fill(c);
   rectMode(CENTER);
   rect(0,0,mass, mass/2);
   popMatrix();
    
  }
  
  void applyForce(PVector f)
  {
    PVector force = PVector.div(f, mass);
    acc.add(force);
    
    
  }
  
  boolean isDead()
  {
   return pos.y > height + 50; 
  }
}
