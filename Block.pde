class Block {
  float x, y;
  float diam = 20;
  
  public Block(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(0);
    rect(x, y, diam, diam);
  }
}
