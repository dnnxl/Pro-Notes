ArrayList<Agent> agents;
PVector gravity;
GifMaker gifExport;
import gifAnimation.*;
void setup() {
  size(350,350,P2D); 
  background(0);
  agents = new ArrayList();
  for (int i = 0; i < 1000; i++) {
    Agent a = new Agent(random(width), random(height), random(1, 20));
    agents.add(a);
  }
  gravity = new PVector(0, 0.1);
  
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
    a.addForce(PVector.mult(gravity, a.mass));
    if (keyPressed && key == 'w') a.addForce(new PVector(0, -0.1)); 
    if (keyPressed && key == 'a') a.addForce(new PVector(-0.05, 0)); 
    if (keyPressed && key == 's') a.addForce(new PVector(0, 0.05)); 
    if (keyPressed && key == 'd') a.addForce(new PVector(0.05, 0)); 
  }
  
      gifExport.addFrame();

  if (frameCount == 500) gifExport.finish();
}
