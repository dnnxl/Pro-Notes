float px[] = new float[300];
float py[] = new float[300];
float pr[] = new float[360];
import gifAnimation.*;
GifMaker gifExport;


void setup() {
  size(350, 350, P2D); 

  gifExport = new GifMaker(this, "C:/Users/dnnxl/Random colorful square.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(255); // make white the transparent color -- match browser bg color
  gifExport.setDelay(1000/12);  //12fps in ms
}
void draw() {
  
  gifExport.addFrame();

  if (frameCount == 250) gifExport.finish();
}
void mousePressed() {
  for (int i=0; i<mouseY; i++) {
    px[i] = random(width);
    py[i] = random(height);
    pr[i] = random(360);
  }
}
void mouseDragged() {
  background(random(255), random(255), random(255));
  for (int i=0; i<mouseY; i++) {
    pushMatrix();
    rectMode(CENTER);
    translate(px[i], py[i]);
    rotate(radians(pr[i] + mouseX));
    fill(random(255), random(255), random(255));
    rect(0, 0, 5, 500);
    popMatrix();
  }

  
}
