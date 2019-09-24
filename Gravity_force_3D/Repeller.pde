class Repeller extends Atractor {
  Repeller(float x, float y, float z, float mass) {
    super(x, y, z, mass);
    g = -1;
  }
  void repel(ArrayList<Agent> agents) {
    atract(agents);
  }
}
