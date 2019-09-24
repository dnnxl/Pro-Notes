ArrayList<Agent> agents;
import gifAnimation.*;
GifMaker gifExport;

void setup() {
  //size(800, 800, P2D);
  size(350, 350, P2D); 
  background(0);
  agents = new ArrayList();
  for (int i = 0; i < 1000; i++) {
    Agent a = new Agent(random(width), random(height), random(20, 40), color(random(255), random(255), random(255)));
    agents.add(a);
  }
  
            gifExport = new GifMaker(this, "C:/Users/dnnxl/1.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
}

void draw() {
  background(0);
  for (Agent a : agents) {
    a.display();
    a.update();
    PVector mouse = new PVector(mouseX, mouseY);
    a.seek(mouse);
  }
  
            gifExport.addFrame();
  if (frameCount == 500) gifExport.finish();
}
