abstract class Automaton {
  int rows;
  int cols;
  Cell[][] cells;
  float w;
  
  Automaton(float w) {
    rows = (int)(height / w);
    cols = (int)(width / w);
    this.w = w;
    cells = new Cell[rows][]; 
    for (int r = 0; r < rows; r++) {
      cells[r] = new Cell[cols]; 
      for (int c = 0; c < cols; c++) {
        cells[r][c] = createCell(c * w, r * w, w);
      }
    }
  }
  abstract Cell createCell(float x, float y, float w);
  abstract void next();
  void display() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        cells[r][c].display();
      }
    }
  }
  abstract void click();
}
