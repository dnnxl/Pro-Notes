class Conway extends Automaton {
  Conway(float w) {
    super(w);
  }
  Cell createCell(float x, float y, float w) {
    return new ConwayCell(x, y, w, (int)random(2));
  }
  void next() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        int n = neighbors(r, c);
        Cell cell = cells[r][c];
        // Muerte por despoblación
        if (cell.state == 1 && n < 2) cell.newState = 0;
        // Muerte por sobrepoblación
        else if (cell.state == 1 && n > 3) cell.newState = 0;
        // Nacimiento
        else if (cell.state == 0 && n == 3) cell.newState = 1;
        // Permanencia
        else cell.newState = cell.state;
      }
    }
  }
  int neighbors(int row, int col) {
    int result = 0;
    for (int r = row - 1; r < row + 2; r++) {
      for (int c = col - 1; c < col + 2; c++) {
        if (r != row || c != col) {
          result += cells[(r + rows) % rows][(c + cols) % cols].state;
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
