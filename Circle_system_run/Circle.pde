class Circle
{
  PVector pos;
  float r;


  Circle(float x, float y, float r)
  {
    pos = new PVector(x, y);
    this.r = r;
  }

  void setPos(float x, float y)
  {
    pos.x = x;
    pos.y = y;
  }

  boolean touch(Circle c)
  {
    float dist = PVector.dist(pos, c.pos); 
    return dist < r + c.r;
  }

  void display()
  {
    noStroke();
    fill(color(random(255), random(255), random(255), random(255)));
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }
}
