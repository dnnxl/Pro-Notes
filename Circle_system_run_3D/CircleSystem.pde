class CircleSystem
{
  ArrayList<Circle> circles;
  float size = 20;

  CircleSystem()
  {
    circles = new ArrayList();
    circles.add(new Circle(0,0,0, 100));
    
  }

  void addCircle()
  {
    Circle c = new Circle(random(-width/2, width/2), 
      random(-height/2, height/2), 
      random(-width/2, width/2), size);
    int tries = 0;
    while (touchAny(c))
    {
      c.setPos(random(-width/2, width/2), 
        random(-height/2, height/2), 
        random(-width/2, width/2));
      tries++;
      if (tries > 2000) return;
    }
    move(c);
    circles.add(c);
  }

  boolean touchAny(Circle circle)
  {
    for (Circle c : circles)
    {
      if (circle.touch(c)) return true;
    } 
    return false;
  }

  void move(Circle circle)
  {
    if (circles.size() > 0)
    {
      float minDistance = width * 2;
      Circle closest = null;
      for (Circle c : circles)
      {
        float distance = PVector.dist(circle.pos, c.pos);
        if (distance < minDistance)
        {
          minDistance = distance;
          closest = c;
        }
      }
      PVector dif = PVector.sub(closest.pos, circle.pos);
      dif.setMag(dif.mag() - circle.r - closest.r);
      circle.pos.add(dif);
    }
  }

  void display()
  {
    for (Circle c : circles)
    {
      c.display();
    }
  }
}
