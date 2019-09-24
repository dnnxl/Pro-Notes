ArrayList<Agent> agents;
FlowField field;

import gifAnimation.*;
GifMaker gifExport;

void setup() {
  //size(800, 800, P2D);
  size(350, 350, P2D); 
  background(0);
  agents = new ArrayList();
  field = new FlowField(20);
    gifExport = new GifMaker(this, "C:/Users/dnnxl/Floaking agents.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
  
}

void draw() {
  background(0);
  for (Agent a : agents) {
    PVector mouse = new PVector(mouseX, mouseY);
    //a.seek(mouse);
    a.separate(agents);
    a.align(agents);
    a.cohere(agents);
    a.addForce(field.getForce(a.pos.x, a.pos.y));
    a.display();
    a.update();
  }
  field.display();
  field.update();
  if (mousePressed) {
    for (int i = 0; i < 4; i++) {
      colorMode(HSB);
      color c = color(frameCount % 255, 255, 255);
      Agent a = new Agent(mouseX, mouseY, random(5, 12), c);
      a.addForce(PVector.random2D().setMag(10));
      agents.add(a);
    }
  }
    gifExport.addFrame();
  if (frameCount == 500) gifExport.finish();
}
