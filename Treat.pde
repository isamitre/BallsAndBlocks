class Treat {
  float x, y;
  float xB, yB;
  float diam = 20;
  
  public Treat(float x, float y) {
    this.x = x;
    this.y = y;
    xB = x+diam;
    yB = y+diam;
  }
  void display() {
    fill(0, 255, 0);
    rect(x, y, diam, diam);
  }
  
  boolean isHittingTreat(Cat cat) { 
    if(dist(cat.x, 0, x, 0) <= diam && dist(cat.y, 0, y, 0) <= diam) {
      // Cat hit treat
      return true;
    }
    else
      return false;
    // Cat isn't hitting treat
    /*if ((xB-x)*(cat.x-x) + (yB-y)*(cat.y-y) <= 0) {
      return false;
    }
    */
  }
}
