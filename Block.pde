class Block {
  float x, y;
  float xB, yB;
  float diam = 20;
  
  public Block(float x, float y) {
    this.x = x;
    this.y = y;
    xB = x+diam;
    yB = y;
  }
  
  void display() {
    fill(0);
    rect(x, y, diam, diam);
  }
}
