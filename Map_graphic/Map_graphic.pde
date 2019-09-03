void setup()
{
  fullScreen();
  background(0);
}

void draw()
{
  background(0);
  stroke(255);
  noFill();

  beginShape();
  for (int x = 0; x<= width; x+= 5)
  {      
    float y =  map(noise(x/30.0), 0, 1, 0, height);
    vertex(x, y);
  }
  endShape();
}
