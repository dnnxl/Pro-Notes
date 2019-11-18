class BriansCell extends Cell {
  BriansCell(float x, float y, float w, float state) {
    super(x, y, w, state);
  }
  color getColor() {
    if (state == 0) return color(0);
    if (state == 1) return color(0, 128, 0);
    else return color(0, 255, 0);
  }
}
