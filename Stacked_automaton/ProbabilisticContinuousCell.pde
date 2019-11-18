class ProbabilisticContinuousCell extends Cell {
  float livingLine;
  
  ProbabilisticContinuousCell(float x, float y, float w, float livingLine) {
    super(x, y, w, 0);
    state = random(1);
    this.livingLine = livingLine;
  }
  color getColor() {
    if (state >= livingLine) {
      return color(map(state, livingLine, 1, 100, 255));
    } else {
      return color(0);
    }
  }
}
