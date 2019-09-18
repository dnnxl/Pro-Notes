import java.util.Iterator;
import peasy.*;

ArrayList<System> systemAgents;
ArrayList<Atractor> atractors;
ArrayList<Repeller> repellers;
PeasyCam cam;

//Repeller repeller;
PVector gravity;
float angle = 0;

void setup() {
  fullScreen(P3D);
  background(0);
  gravity = new PVector(0, 0);
  atractors = new ArrayList();
  repellers = new ArrayList();
  systemAgents = new ArrayList();
  cam  =new PeasyCam(this, width/2, height/2, width/2, 100);
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2, -width/2);
  stroke(255);
  noFill();
  box(800);

  for (System s : systemAgents)
  {
    s.addAgent();
    s.display();
    s.update();
  }

  for (Atractor a : atractors)
  {
    a.display();
    a.atract(systemAgents);
  }

  for (Repeller r : repellers)
  {
    r.display();
    r.repel(systemAgents);
  }
  angle += 0.01;
}

void keyPressed()
{
  if (keyPressed && (key == 'S' || key == 's'))
  {
    System a = new System();
    systemAgents.add(a);
  }
  if (keyPressed && (key == 'A' || key == 'a'))
  {
    // Add atractor
    Atractor a = new Atractor(random(-200, 200), random(-200, 200), random(-200, 200), random(500));
    atractors.add(a);
  }
  if (keyPressed && (key == 'R' || key == 'r'))
  {
    // Add repeller
    Repeller r = new Repeller(random(-200, 200), random(-200, 200), random(-200, 200), random(500));
    repellers.add(r);
  }
  if (keyPressed && (key == ' '))
  {
    atractors = new ArrayList();
    repellers = new ArrayList();
    systemAgents = new ArrayList();
  }
}
