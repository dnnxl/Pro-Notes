class Carpet
{
  color carpetColor;
  float heightLevel;
  float noiseR;
  float noiseA;
  float noiseOFF;
  float noiseSpeed;
  float size;
  float thirdParameter;

  Carpet(color pCarpetColor, float pSize, float pThird)
  {
    this.carpetColor = pCarpetColor;
    noiseR = 0.02;
    noiseA = 800;
    noiseOFF = 0;
    noiseSpeed = 0.01;
    this.size = pSize;
    heightLevel = 0;
    this.thirdParameter = pThird;
  }

  void display()
  {
    noiseSeed(0);

    fill(carpetColor);
    translate(0, heightLevel * 0.22, 0);
    for (int r = 0; r<rows; r++) 
    {
      beginShape(TRIANGLE_STRIP);
      for (int c = 0; c<cols; c++) 
      {
        float y1 = noise(r*noiseR, c*noiseR+noiseOFF, thirdParameter) *noiseA;
        float y2 = noise((r+1)*noiseR, c*noiseR+noiseOFF, thirdParameter) * noiseA;
        vertex(r* size, y1, -c * size);
        vertex((r+1)* size, y2, -c * size);
      }
      endShape();
    }
  }

  void update(float pHeightLevel, float pNoiseOFF)
  {
    this.heightLevel = pHeightLevel;
    this.noiseOFF = pNoiseOFF;
  }
}
