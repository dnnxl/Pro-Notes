import java.util.HashSet;

enum Neigh {
  VON_NEUMANN, MOORE
};

class Automaton3D {
  int rows, cols, depth;
  float w;
  int stateNumber;
  int stateAlive;
  int stateDead;
  Neigh neigh = Neigh.MOORE;

  HashSet<Integer> survivalRule;
  HashSet<Integer> birthRule;

  Cell[][][] cells;

  Automaton3D(float w, int stateNumber, int rows) {
    this.rows = rows;
    this.cols = rows;
    this.depth = rows;
    this.stateNumber = stateNumber;
    this.w = w;
    stateDead = 0;
    stateAlive = stateNumber - 1;
    survivalRule = new HashSet();
    birthRule = new HashSet();
    createCells();
  }
  Automaton3D(float w, int stateNumber) {
    this(w, stateNumber, 60);
  }
  void createCells() {
    cells = new Cell[rows][][];
    for (int r = 0; r < rows; r++) {
      cells[r] = new Cell[cols][];
      for (int c = 0; c < cols; c++) {
        cells[r][c] = new Cell[depth];
        for (int d = 0; d < depth; d++) {
          cells[r][c][d] = new Cell(c * w, r * w, d * w, w, 
            (int)random(stateNumber), stateNumber);
        }
      }
    }
  }
  void clearCells() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        for (int d = 0; d < depth; d++) {
          cells[r][c][d].state = 0;
        }
      }
    }
  }
  void cubeCells(int row, int col, int dep, int w) {
    clearCells();
    for (int r = row - w/2; r < row + w/2 + w%2; r++) {
      for (int c = col - w/2; c < col + w/2 + w%2; c++) {
        for (int d = dep - w/2; d < dep + w/2 + w%2; d++) {
          cells[(r + rows) % rows][(c + cols) % cols][(d + depth) % depth].state 
            = stateAlive;
        }
      }
    }
  }
  void cubeCellsRandom(int row, int col, int dep, int w) {
    clearCells();
    for (int r = row - w/2; r < row + w/2 + w%2; r++) {
      for (int c = col - w/2; c < col + w/2 + w%2; c++) {
        for (int d = dep - w/2; d < dep + w/2 + w%2; d++) {
          cells[(r + rows) % rows][(c + cols) % cols][(d + depth) % depth].state 
            = (int)random(stateNumber);
        }
      }
    }
  }
  void addSurvivalCase(int n) {
    survivalRule.add(n);
  }
  void addBirthCase(int n) {
    birthRule.add(n);
  }
  void next() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        for (int d = 0; d < depth; d++) {
          int n = 0;
          switch (neigh) {
          default:
          case MOORE:
            n = mooreNeighbors(r, c, d);
            break;
          case VON_NEUMANN:
            n = vonNeumannNeighbors(r, c, d);
            break;
          }
          applyRules(cells[r][c][d], n);
          cells[r][c][d].display();
        }
      }
    }
    updateState();
  }
  int mooreNeighbors(int row, int col, int dep) {
    int n = 0;
    for (int r = row - 1; r < row + 2; r++) {
      for (int c = col - 1; c < col + 2; c++) {
        for (int d = dep - 1; d < dep + 2; d++) {
          if (r != row || c != col || d != dep) {
            if (cells[(r + rows) % rows][(c + cols) % cols][(d + depth) % depth].state 
                  == stateAlive) {
              n++;
            }
          }
        }
      }
    }
    return n;
  }
  int vonNeumannNeighbors(int row, int col, int dep) {
    int n = cells[(row + rows - 1) % rows][col][dep].state == stateAlive? 1 : 0;
    n += cells[(row + rows + 1) % rows][col][dep].state == stateAlive? 1 : 0;
    n += cells[row][(col + cols - 1) % cols][dep].state == stateAlive? 1 : 0;
    n += cells[row][(col + cols + 1) % cols][dep].state == stateAlive? 1 : 0;
    n += cells[row][col][(dep + depth - 1) % depth].state == stateAlive? 1 : 0;
    n += cells[row][col][(dep + depth + 1) % depth].state == stateAlive? 1 : 0;
    return n;
  }
  void applyRules(Cell c, int n) {
    if (c.state == stateAlive && survivalRule.contains(n)) c.newState = stateAlive;
    else if (c.state == 0 && birthRule.contains(n)) c.newState = stateAlive;
    else c.newState = constrain(c.state - 1, 0, stateNumber);
  }
  void updateState() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        for (int d = 0; d < depth; d++) {
          cells[r][c][d].update();
        }
      }
    }
  }
  void display() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        for (int d = 0; d < depth; d++) {
          cells[r][c][d].display();
        }
      }
    }
  }
}
