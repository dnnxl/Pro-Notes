class ConwayCell extends Cell {
  ConwayCell(float x, float y, float w, int state) {
    super(x, y, w, state);
  }
  color getColor() {
    return state == 0? color(0) : color(0, random(100, 255), random(255));
  }
}
