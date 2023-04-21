class Block {
  float x, y;
  float diam = 20;

  // block constructor
  public Block(Grid grid) {
    do {
      x = random(0, width-diam);
      y = random(0, height/3);

      // make x and y a multiple of 20
      x = x-x%diam;
      y = y-y%diam;
    } while (grid.isSpaceOccupied(x, y));

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
