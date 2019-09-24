ArrayList<Agent> agents;
PVector gravity;

import gifAnimation.*;
GifMaker gifExport;

void setup() {
  size(350, 350, P3D); 
  //fullScreen();
  background(0);
  agents = new ArrayList();
  for (int i = 0; i < 100; i++) {
    Agent a = new Agent(random(width), random(height));
    a.addForce(PVector.random2D().setMag(1));
    agents.add(a);
  }
  gravity = new PVector(0, 0.01);
  
          gifExport = new GifMaker(this, "C:/Users/dnnxl/1.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
}

void draw() {
  background(0);
  for (Agent a : agents) {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dif = PVector.sub(mouse, a.pos);
    dif.setMag(map(constrain(dif.mag(), 0, 200), 0, 200, 0.1, 0));
    a.addForce(dif);
    a.addForce(gravity);
    a.display();
    a.update();
  }
  
          gifExport.addFrame();
  if (frameCount == 500) gifExport.finish();
}
