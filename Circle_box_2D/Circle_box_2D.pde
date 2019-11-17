import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import java.util.Iterator;

Box2DProcessing box2d;
ArrayList<Agent> agents;
Surface surface;

void setup() {
  size(350, 350, P2D); 
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  agents = new ArrayList();
  surface = new Surface();
}

void draw() {
  background(0);
  surface.display();
  for (Agent a : agents) a.display();
  box2d.step();
  Iterator<Agent> it = agents.iterator(); 
  while (it.hasNext()) {
    Agent a = it.next();
    if (a.isDead()) {
      it.remove();
    }
  }
  if (mousePressed) {
    agents.add(new Agent(mouseX, mouseY, random(10, 20)));
  }
}
