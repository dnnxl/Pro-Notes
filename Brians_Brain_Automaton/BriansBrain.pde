class BriansBrain extends Automaton {
  BriansBrain(float w) {
    super(w);
  }
  Cell createCell(float x, float y, float w) {
    return new BriansCell(x, y, w, (int) random(3));
  }
  void next() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        int n = aliveNeighbors(r, c);
        Cell cell = cells[r][c];
        if (cell.state == 0 && n == 2) cell.newState = 2;
        if (cell.state == 2) cell.newState = 1;
        if (cell.state == 1) cell.newState = 0;
      }
    }
  }
  int aliveNeighbors(int row, int col) {
    int result = 0;
    for (int r = row - 1; r < row + 2; r++) {
      for (int c = col - 1; c < col + 2; c++) {
        if (r != row || c != col) {
          result += (cells[(r + rows) % rows][(c + cols) % cols].state == 2)? 1 : 0;
        } 
      }
    }
    return result;
  }
  void click() {
    int c = (int)(mouseX / w);
    int r = (int)(mouseY / w);
    if (r < rows && c < cols) {
      cells[r][c].newState = cells[r][c].state = 2;
    }
  }
}
