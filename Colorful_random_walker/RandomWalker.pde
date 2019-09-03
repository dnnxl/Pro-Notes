class RandomWalker
{
  float x;
  float y;
  color c;
  
  RandomWalker(float x, float y)
  {
    this.x = x;
    this.y = y;
    colorMode(HSB);
    c = color(frameCount %255, 255, 255);
  }
  
  void display()
  {
    stroke(c);
    strokeWeight(6);
    point(x,y); 
  }
  
  void update()
  {
    float i = random(0, 100);
    if(i < 10)
    {
      y-=5;
    }
    else if(i < 40)
    {
      y+=5;
    }
    else if(i < 50)
    {
      x-=5;
    }
    else if(i < 60)
    {
      x+=5;
    }
    else if(i < 70)
    {
     x+=5;
     y-=5;
    }
     else if(i < 80)
    {
     x-=5;
     y-=5;
    }
     else if(i < 90)
    {
     x-=5;
     y+=5;
    }
     else if(i < 100)
    {
     x+=5;
     y+=5;
    }
    
    x =x%width;
    y = y%height;
  }
}
