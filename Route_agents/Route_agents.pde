boolean debug = true;
ArrayList<Agent> agents;
Path p;
import gifAnimation.*;
GifMaker gifExport;
void setup() {
  //size(500, 500);
  size(350, 350, P2D); 
  agents = new ArrayList();
  p = new Path(0, random(height), width, random(height));
  background(0);
  
    gifExport = new GifMaker(this, "C:/Users/dnnxl/Route agents.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
}

void draw() {
  background(0);
  p.display();
  for (Agent a : agents) {
    a.follow(p);
    a.update();
    a.display();
  }
  if (mousePressed) {
    Agent a = new Agent(mouseX, mouseY);
    a.addForce(PVector.random2D().setMag(5));
    agents.add(a);
  }
    gifExport.addFrame();
  if (frameCount == 500) gifExport.finish();
}
