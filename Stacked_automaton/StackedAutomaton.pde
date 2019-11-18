import java.util.LinkedList;

class StackedAutomaton {
  Automaton automaton;
  float width;
  float height;
  float depth;
  int levels;
  LinkedList<color[][]> generations;
  
  StackedAutomaton(Automaton automaton, int levels) {
    this.automaton = automaton;
    this.levels = levels;
    generations = new LinkedList();
    width = automaton.rows * automaton.w;
    depth = automaton.cols * automaton.w;
    height = levels * automaton.w;
  }
  void next() {
    generations.add(getCellsStates());
    if (generations.size() > levels) generations.remove();
    automaton.next();
  }
  color[][] getCellsStates() {
    color[][] states = new color[automaton.rows][];
    for (int r = 0; r < automaton.rows; r++) {
      states[r] = new color[automaton.cols];
      for (int c = 0; c < automaton.cols; c++) {
        states[r][c] = automaton.cells[r][c].getColor();
      }
    }
    return states;
  }
  void display() {
    float w = automaton.w;
    for (int gen = 0; gen < generations.size(); gen++) {
      for (int r = 0; r < automaton.rows; r++) {
        for (int c = 0; c < automaton.cols; c++) {
          pushMatrix();
          translate(r * w, gen * w, c * w);
          noStroke();
          color cellColor = generations.get(gen)[r][c];
          if (cellColor != color(0)) {
            if (gen == generations.size() - 1) cellColor = color(255);
            fill(cellColor);
            box(w);
          }
          popMatrix();
          automaton.cells[r][c].update();
        }
      }
    }
  }
}
