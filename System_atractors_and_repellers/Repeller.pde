class Repeller extends Atractor {
  Repeller(float x, float y, float z, float mass) {
    super(x, y, z, mass, color(#3B21B4));
    g = -2;
  }
  void repel(ArrayList<System> system) {
    atract(system);
  }
}
