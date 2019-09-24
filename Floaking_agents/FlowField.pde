class FlowField {
  PVector[][] grid;
  int rows;
  int cols;
  float resolution;
  float defaultMag = 8;
  float noiseOffset = 0.2;
  float noiseZ = 0;
  float noiseInc = 0.01;

  FlowField(float resolution) {
    this.resolution = resolution;
    rows = (int)(height / resolution) + 1;
    cols = (int)(width / resolution) + 1;
    grid = new PVector[rows][];
    for (int r = 0; r < rows; r++) {
      grid[r] = new PVector[cols];
      for (int c = 0; c < cols; c++) {
        float angle = map(noise((float)r * noiseOffset, (float)c * noiseOffset, noiseZ), 
          0, 1, 0, TWO_PI);
        grid[r][c] = PVector.fromAngle(angle);
        grid[r][c].setMag(defaultMag);
      }
    }
  }
  void display() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        displayVector(grid[r][c], c * resolution, r * resolution);
      }
    }
  }
  void displayVector(PVector vector, float x, float y) {
    PVector v = vector.copy();
    v.setMag(resolution / 2);
    pushMatrix();
    translate(x + resolution/2, y + resolution/2);
    stroke(255);
    line(0, 0, v.x, v.y);
    popMatrix();
  }
  void update() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        float angle = map(noise((float)r * noiseOffset, (float)c * noiseOffset, noiseZ), 
                          0, 1, 0, TWO_PI);
        grid[r][c] = PVector.fromAngle(angle);
        grid[r][c].setMag(defaultMag);
      }
    }
    noiseZ += noiseInc;
  }
  PVector getForce(float x, float y) {
    if (x >= 0 && x <= width) {
      if (y >= 0 && y <= height) {
        int r = (int)(y / resolution);
        int c = (int)(x / resolution);
        return grid[r][c];
      }
    }
    return new PVector(0, 0);
  }
}
