class Wolfram {
  int cols;
  int ruleset;
  boolean[] cells;
  float y;
  
  Wolfram(int cols, int ruleset) {
    this.cols = cols;
    this.ruleset = ruleset;
    cells = new boolean[cols];
    initCells();
    y = 0;
  }
  void initCells() {
    for (int i = 0; i < cols; i++) cells[i] = false;
    cells[cols / 2] = true;
  }
  void next() {
    boolean[] gen = new boolean[cols];
    for (int i = 0; i < cols; i++) gen[i] = f(i);
    cells = gen;
    if (y >= height) {
      //background(255);
      y = 0;
    }
  }
  boolean f(int i) {
    boolean left = cells[(i - 1 + cols) % cols];
    boolean center = cells[i];
    boolean right = cells[(i + 1) % cols];
    
    int pow = left? 4 : 0;
    pow += center? 2 : 0;
    pow += right? 1 : 0;
    int mask = (int)pow(2, pow);
    return (ruleset & mask) != 0;
  }
  void display() {
    float cellw = width / (float)cols;
    for (int i = 0; i < cols; i++) {
      float x = (float)i * cellw;
      fill(cells[i]? 0 : 255);
      noStroke();
      rect(x, y, cellw, cellw);
    }
    y += cellw;
  }
  void increaseRuleset() {
    ruleset = (ruleset + 1) % 256;
    initCells();
  }
}
