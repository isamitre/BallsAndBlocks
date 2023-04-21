class Treat {
  float x, y;
  float diam = 20;
  PImage icon;

  public Treat(Grid grid) {

    do {
      x = random(diam, width-diam);
      y = random(diam, height/2);

      // make x and y a multiple of 20
      x = x-x%diam;
      y = y-y%diam;
      
    } while (grid.isSpaceOccupied(x, y));
    
    grid.setOccupancy(x, y, true);

    icon = loadImage("fish.png");
  }
  
  // displays treat
  void display() {
    fill(#4137BC);  // color needs to be fixed
    rect(x, y, diam, diam);
    imageMode(CORNER);
    image(icon, x, y, diam, diam);
  }


  // returns if cat is hitting treat
  boolean isHittingTreat(Cat cat) {
    // cat hitting treat vertically
    if ( (cat.x+cat.diam/2) >= x
      && (cat.x-cat.diam/2) <= (x+diam)
      && (cat.y+cat.diam/2) >= y
      && (cat.y-cat.diam/2) <= (y+diam)) {
      return  true;
    }
    return false;

    //if(dist(cat.x, 0, x, 0) <= diam && dist(cat.y, 0, y, 0) <= diam) {
    //  // Cat hit treat
    //  return true;
    //}
    //else
    //  return false;
    // Cat isn't hitting treat
    /*if ((xB-x)*(cat.x-x) + (yB-y)*(cat.y-y) <= 0) {
     return false;
     }
     */
  }
}
