class ProbabilisticContinuous extends Automaton {
  float overpopulationThreshold = 4.18;
  float underpopulationThreshold = 1.8;
  float birthMinThreshold = 1.83;
  float birthMaxThreshold = 4.09;
  float livingLine = 0.55;
  float birthMinValue = 0.4;
  float birthMaxValue = 1;
  float deathMinValue = 0;
  float deathMaxValue = 0.31;
  float agingRatio = 0.09;

  ProbabilisticContinuous(float w) {
    super(w);
  }
  Cell createCell(float x, float y, float w) {
    return new ProbabilisticContinuousCell(x, y, w, livingLine);
  }
  void next() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        float n = neighbors(r, c);
        Cell cell = cells[r][c];
        if (cell.state >= livingLine && n < underpopulationThreshold) {
          cell.newState = random(deathMinValue, deathMaxValue);
        } else if (cell.state >= livingLine && n > overpopulationThreshold) {
          cell.newState = random(deathMinValue, deathMaxValue);
        } else if (cell.state < livingLine 
                    && n > birthMinThreshold && n < birthMaxThreshold) {
          cell.newState = random(birthMinValue, birthMaxValue);
        } else {
          cell.newState = constrain(cell.state - agingRatio, 0, 1);
        }
      }
    }
  }
  float neighbors(int row, int col) {
    float result = 0;
    for (int r = row - 1; r < row + 2; r++) {
      for (int c = col - 1; c < col + 2; c++) {
        if (r != row || c != col) {
          if (cells[(r + rows) % rows][(c + cols) % cols].state >= livingLine) {
          result += cells[(r + rows) % rows][(c + cols) % cols].state;
          }
        } 
      }
    }
    return result;
  }
  void click() {
    int c = (int)(mouseX / w);
    int r = (int)(mouseY / w);
    if (r < rows && c < cols) {
      cells[r][c].newState = cells[r][c].state = 1;
    }
  }
}
