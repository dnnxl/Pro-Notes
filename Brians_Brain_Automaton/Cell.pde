abstract class Cell {
  float x;
  float y;
  float w;
  float state;
  float newState;
  
  Cell(float x, float y, float w, float state) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.state = state;
  }
  void display() {
    color c = getColor();
    noStroke();
    fill(c);
    if (c != color(0)) {
      rect(x, y, w, w);
    }
    state = newState;
  }
  abstract color getColor();
}
