class Block {
  float x, y;
  float diam = 20;

  // block constructor
  public Block(Cat cat, Grid grid) {
    do {
      x = random(diam, width-diam);
      y = random(diam, height/3);

      // make x and y a multiple of 20
      x = x-x%diam;
      y = y-y%diam;
    } while (grid.isSpaceOccupied(x, y) || isTooCloseToCat(cat));

    grid.setOccupancy(x, y, true);
  }

  // display block
  void display() {
    fill(0);
    rect(x, y, diam, diam);
  }

  // returns whether the block coordinates are too close to cat
  private boolean isTooCloseToCat(Cat cat) {
    if (abs(cat.x - x) <= 2*diam) {
      return true;
    }
    if (abs(cat.y - y) <= 2*diam) {
      return true;
    }
    return false;
  }
}
