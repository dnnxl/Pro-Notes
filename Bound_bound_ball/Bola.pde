class Bola
{
  PVector pos;
  PVector vel;
  float d;
  color c;

  Bola(float x, float y)
  {
    pos = new PVector(x, y);
    vel = PVector.random2D(); // dEVULEVE UNA INSTANCIA DE UN VECTOR QUE APUNTA A CUALQUIER DIRECCION, MANIGTUD 1

    vel.setMag(random(0, 50));

    d = random(100);
    c = color(random(255), random(255), random(255), random(255));
  }

  void display()
  {
    noStroke();
    fill(c);
    /*
    int h = (int) random(0,3);
     if(h == 0)
     {
     ellipse(pos.x, pos.y, d, d);
     }
     if(h == 1)
     {
     triangle(pos.x, pos.y, d, d, d, d);
     }
     else
     {
     rect(pos.x, pos.y, d, d);
     }
     */
     
    // translate(width/2, height/2);
    rotate(PI/9.0);
    //rect(pos.x, pos.y, d, d);
    ellipse(pos.x, pos.y, d, d);
  }

  void update()
  {
    pos.add(vel);
    if (pos.x >= width - d/2 || pos.x <= d/2)
    {
      vel.x *= -1;
      pos.x = constrain(pos.x, d/2, width -d/2); // Restringir el valor de pos.x, solo quede entre d/2 y width -d/2
    } else if (pos.y >= height - d/2 || pos.y <= d/2)
    {
      vel.y *= -1;
      pos.y =  constrain(pos.y, d/2, width -d/2);
    }
  }
}
