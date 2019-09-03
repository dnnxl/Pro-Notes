RandomWalker Joe;
ArrayList <RandomWalker> walkers;
void setup()
{
  fullScreen(); 
  //size(900,900);
  background(255);
  //Joe = new RandomWalker(width/2, height/2);
  
  walkers = new ArrayList();
  //for(int x = 0; x <= width; x += 10)
  //{
  //  int i = random
  // walkers.add(new RandomWalker(x, 0));
  //}
  
  frameRate(50);
}

void draw()
{
  for(RandomWalker w: walkers)
  {
     w.display();
     w.update();
  }
  if (mousePressed)
  {


  walkers.add(new RandomWalker(mouseX, mouseY));

  }

}

/*
void mousePressed()
{
  walkers.add(new RandomWalker(mouseX, mouseY));
}
*/

void keyPressed()
{
  if(key == ' ') background(255);
  if(key == 'g' || key == 'G') 
  {
   saveFrame("img\\####.png"); 
  }
}
