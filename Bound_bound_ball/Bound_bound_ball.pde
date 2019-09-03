ArrayList<Bola> bolas;

Bola b;

void setup()
{
  fullScreen();
  b = new Bola(width/2, height/2);
  bolas = new ArrayList();
  blendMode(SUBTRACT );
}

// Ciclo de animación 60 veces/cuadros por segundo
void draw()
{
  background(255);
  for(Bola b: bolas)
  {
   b.display();
   b.update();
  }
  if(mousePressed)
  {
   bolas.add(new Bola(mouseX, mouseY)); 
  }
}
