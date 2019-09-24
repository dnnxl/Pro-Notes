class Path {
  PVector start;
  PVector end;
  float r;
  
  Path(float x1, float y1, float x2, float y2) {
    start = new PVector(x1, y1);
    end = new PVector(x2, y2);
    r = 15;
  }
  void display() {
    strokeWeight(r * 2);
    stroke(#FC00A9);
    line(start.x, start.y, end.x, end.y);
    strokeWeight(1);
    stroke(255);
    line(start.x, start.y, end.x, end.y);
  }
}
