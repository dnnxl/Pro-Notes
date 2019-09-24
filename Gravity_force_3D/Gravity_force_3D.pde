ArrayList<Agent> agents;
Atractor atractor;
Repeller repeller;
PVector gravity;
float angle = 0;

import gifAnimation.*;
GifMaker gifExport;

void setup() {
  size(350, 350, P3D); 
  //fullScreen();
  background(0);
  agents = new ArrayList();
  atractor = new Atractor(-width/4, 0, 0, 500);
  repeller = new Repeller(width/4, 0, 0, 100);
  gravity = new PVector(0, 0);
  
        gifExport = new GifMaker(this, "C:/Users/dnnxl/1.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2, -width/2);
  rotateY(angle);
  for (Agent a : agents) {
    a.addForce(PVector.div(gravity, a.mass));
    a.display();
    a.update();
  }
  atractor.display();
  atractor.atract(agents);
  repeller.display();
  repeller.repel(agents);
  if (mousePressed) {
    Agent a = new Agent(mouseX - width/2, mouseY - height/2, -width/2, 10);
    a.addForce(PVector.random3D().setMag(5));
    agents.add(a);
  }
  angle += 0.01;
  
        gifExport.addFrame();
  if (frameCount == 1000) gifExport.finish();
}
