ArrayList<Agent> agents;
Atractor atractor;
Repeller repeller;

import gifAnimation.*;
GifMaker gifExport;

void setup() {
  size(350, 350, P2D); 
  //fullScreen();
  background(0);
  agents = new ArrayList();
  for (int i = 0; i < 200; i++) {
    Agent a = new Agent(random(width), random(height), 5);
    a.addForce(PVector.random2D().setMag(10));
    agents.add(a);
  }
  atractor = new Atractor(width/3, height/2, 1000);
  repeller = new Repeller(width * 2/3, height/2, 500);
  
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
  }
  atractor.display();
  atractor.atract(agents);
  repeller.display();
  repeller.repel(agents);
  
        gifExport.addFrame();
  if (frameCount == 500) gifExport.finish();
}
