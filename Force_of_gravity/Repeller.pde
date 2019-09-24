class Repeller extends Atractor {
  Repeller(float x, float y, float mass) {
    super(x, y, mass);
    g = -1;
  }
  void repel(ArrayList<Agent> agents) {
    atract(agents);
  }
}
