ArrayList<Agent> agents;
PVector gravity;
PVector floatForce;

import gifAnimation.*;
GifMaker gifExport;

void setup() {
  size(350, 350, P2D); 
  background(0);
  agents = new ArrayList();
  gravity = new PVector(0, 0.1);
  floatForce = new PVector(0.2, -2);
  
      gifExport = new GifMaker(this, "C:/Users/dnnxl/1.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
}

void draw() {
  background(0);
  fill(#307AD1);
  rect(0, height/2, width, height/2);
  for (Agent a : agents) {
    a.display();
    a.update();
    a.addForce(PVector.mult(gravity, a.mass));
    if (a.pos.y > height / 2) {
      PVector v = a.vel.copy();
      float mag = v.mag();
      v.normalize();
      float coef = 1;
      v.mult(pow(mag, 2));
      v.mult(-coef);
      a.addForce(v);
      a.addForce(floatForce);
    }
  }
  if (mousePressed) {
    Agent a = new Agent(mouseX, mouseY, randomGaussian() * 2 + 10);
    a.addForce(PVector.random2D().setMag(30));
    agents.add(a);
  }
  
      gifExport.addFrame();
  if (frameCount == 1000) gifExport.finish();
}
