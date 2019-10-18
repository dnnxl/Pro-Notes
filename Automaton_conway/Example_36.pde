import gifAnimation.*;

GifMaker gifExport;

Automaton a;
void setup(){
  size(350,350,P2D); 
  a =new Conway(10);
  
    gifExport = new GifMaker(this, "C:/Users/dnnxl/Automaton.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms

}
void draw(){
  //background(0);
  fill(0,50);
  rect(0,0,width,height);
  a.click();
  a.next();
  a.display();
 
  
  a.display();

  gifExport.addFrame();

  if (frameCount == 250) gifExport.finish();
}
