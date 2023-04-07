class Treat {
  float x, y;
  float xB, yB;
  float diam = 30;
  
  public Treat(float x, float y) {
    this.x = x;
    this.y = y;
    xB = x+diam;
    yB = y+diam;
  }
  void display() {
    fill(0);
    ellipse(x, y, diam/2, diam/2);
  }
  
  boolean isHittingBlock(Cat cat) { 
    // is outside the block
    if ( (xB-x)*(cat.x-x) + (yB-y)*(cat.y-y) <= 0) {
      return false;
    }
    // is inside the block
    return true;
  }
}
