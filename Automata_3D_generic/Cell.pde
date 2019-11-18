class Cell {
  float x, y, z;
  float w;
  float state, newState;
  float stateNumber;
  
  Cell(float x, float y, float z, float w, float state, float stateNumber) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
    this.state = state;
    this.stateNumber = stateNumber;
  }
  void display() {
    color c = getColor();
    noStroke();
    fill(c);
    pushMatrix();
    translate(x, y, z);
    if (c != color(0)) box(w);
    popMatrix();
  }
  void update() {
    state = newState;
  }
  color getColor() {
    if (state == 0) return color(0);
    else {
      colorMode(HSB);
      color c = color(map(state, 0, stateNumber, 0, 128), 255, 255);
      return c;
    }
  }
}
