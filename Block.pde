class Block {
  float x, y;
  float diam = 20;
  
  public Block(float x, float y) {
    this.x = x-x%diam;
    this.y = y-y%diam;
  }
  
  void display() {
    fill(0);
    rect(x, y, diam, diam);
  }
}
