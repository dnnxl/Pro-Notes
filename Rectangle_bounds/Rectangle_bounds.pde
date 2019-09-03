// Variables globales
float x = 0;
float y = 0;
float xInc = 50; // Velocidad en x
float yInc = 50; // Velocidad en y
float d = 50; // diametro
color c = color(#FABC23); // Color 

// Se ejecuta una vez la subrutina setup
void setup()
{
  size(800,800); // Make a window
  x = width /2;
  y = height/2;
}

// Ciclo de animación 60 veces/cuadros por segundo
void draw()
{
  //ellipse(width/2, height/2, 125,125); // Circulo en el centro
  //background(255,0,0); // RGB y HSB
  background(#89211D); // RGB hexadecimal y HSB
  
  //rect(x, y, d, d);
  
  //rectMode(CORNERS);  // Set rectMode to CORNERS
  rectMode(CENTER);  // Set rectMode to CORNERS

  fill(c);  // Set fill to gray
  rect(x, y, d, d);  // Draw gray rect using CORNERS mode
  
  //ellipse(x, y, d,d);
  stroke(#FFFFFF); // Linea
  strokeWeight(6); // Grosor
  fill(#725CA5); // Rellenar
  
  //ellipse(mouseX, mouseY, 125,125); // Dibujar el circulo según el parametro de x y y del mouse
  if(x >= width - d/2 || x <= d/2)
  {
    xInc *= -1;
  }
  else if(y >= height - d/2 || y <= d/2)
  {
    yInc *= -1;
  }
   x += xInc;
   y += yInc;
   stroke(c);//(#76C7EA);
   line(0,0,x, y);
   line(width,0,x, y);
   line(0,height,x, y);
   line(width,height,x, y);

    d = map(mouseY,0, height, 10, 100); // Mapeo linear de valores
    colorMode(HSB);
    c = color(mouseX%256, 255, 255);
}
