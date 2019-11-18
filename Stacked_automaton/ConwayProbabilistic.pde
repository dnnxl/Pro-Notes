class ConwayProbabilistic extends Conway {
  float underProb;
  float overProb;
  float birthProb;
  float permProb;

  ConwayProbabilistic(float w, float under, float over, float birth, float perm) {
    super(w);
    underProb = under;
    overProb = over;
    birthProb = birth;
    permProb = perm;
  }
  void next() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        int n = neighbors(r, c);
        Cell cell = cells[r][c];
        // Muerte por despoblación
        if (cell.state == 1 && n < 2) {
          if (random(1) < underProb) {
            cell.newState = 0;
          } else {
            cell.newState = 1;
          }
        }
        // Muerte por sobrepoblación
        else if (cell.state == 1 && n > 3) {
          if (random(1) < overProb) {
            cell.newState = 0;
          } else {
            cell.newState = 1;
          }
        }
        // Nacimiento
        else if (cell.state == 0 && n == 3) {
          if (random(1) < birthProb) {
            cell.newState = 1;
          } else {
            cell.newState = 0;
          }
        }
        // Permanencia
        else if (random(1) < permProb) {
          cell.newState = cell.state;
        } else {
          cell.newState = cell.state == 0? 1 : 0;
        }
      }
    }
  }
}
