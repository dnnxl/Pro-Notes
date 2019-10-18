Automaton a;
void setup(){
  fullScreen();
  a =new Conway(10);

}
void draw(){
  //background(0);
  fill(0,50);
  rect(0,0,width,height);
  a.click();
  a.next();
  a.display();
 
  
  a.display();

}
