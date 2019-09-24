Cannon cannon;
import gifAnimation.*;
GifMaker gifExport;
void setup()
{
  size(350, 350, P2D); 
  background(0);
  cannon = new Cannon(width/2, height/2);
  
    gifExport = new GifMaker(this, "C:/Users/dnnxl/Cannon agents.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
}


void draw()
{
     background(0);

  cannon.update();
  cannon.display();
  if(mousePressed)
  {
    cannon.shoot();
  }
  
    gifExport.addFrame();
  if (frameCount == 500) gifExport.finish();
}
