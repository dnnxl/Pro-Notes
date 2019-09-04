class Circle
{
  PVector pos;
  float r;
  color c;

  Circle(float x, float y, float z, float r)
  {
    pos = new PVector(x, y, z);
    this.r = r;
    c = color(random(255), random(255), random(255));
  }

  Circle(float x, float y, float z, float r, color c)
  {
    pos = new PVector(x, y, z);
    this.r = r;
    c = c;
  }

  void setPos(float x, float y, float z)
  {
    pos.x = x;
    pos.y = y;
    pos.z = z;
  }

  boolean touch(Circle c)
  {
    float dist = PVector.dist(pos, c.pos); 
    return dist < r + c.r;
  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(c);// random(255)));
    //fill(color(random(255), random(255), random(255), random(255)));
    sphere(r);
    popMatrix();
  }
}
