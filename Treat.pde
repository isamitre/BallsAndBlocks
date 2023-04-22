class Treat {
  float x, y;
  float diam = 20;
  PImage fish;

  public Treat(float x, float y) {
    this.x = x;
    this.y = y;
    fish = loadImage("fish.png");
  }

  public Treat(Grid grid) {

    do {
      x = random(diam, width-diam);
      y = random(diam, height/2);

      // make x and y a multiple of 20
      x = x-x%diam;
      y = y-y%diam;
    } while (grid.isSpaceOccupied(x, y));

    grid.setOccupancy(x, y, true);

    fish = loadImage("fish.png");
  }

  // displays treat
  void display() {
    //strokeWeight(1);
    //fill(#4137BC);
    //rectMode(CORNER);
    //rect(x, y, diam, diam);
    imageMode(CORNER);
    image(fish, x, y, diam, diam);
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
  }
}
