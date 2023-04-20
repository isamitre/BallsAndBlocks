class Block {
  float x, y;
  float diam = 20;

  // block constructor
  public Block(Cat cat, ArrayList<Treat> treats) {
    do {
      x = random(30, width-30);
      y = random(30, height/3);
      // make x and y a multiple of 20
      x = x-x%diam;
      y = y-y%diam;
    } while (isTooCloseToCat(cat) || isTooCloseToTreats(treats));
  }

  // returns whether the block coordinates are too close to cat
  private boolean isTooCloseToCat(Cat cat) {
    if (abs(cat.x - x) <= 3*diam) {
      return true;
    }
    if (abs(cat.y - y) <= 3*diam) {
      return true;
    }
    return false;
  }

  // returns whether the block coordinates are too close to any treat
  private boolean isTooCloseToTreats(ArrayList<Treat> treats) {
    for (Treat treat : treats) {
      if (abs(treat.x - x) <= 3*diam) {
        return true;
      }
      if (abs(treat.y - y) <= 3*diam) {
        return true;
      }
    }
    return false;
  }

  // display block
  void display() {
    fill(0);
    rect(x, y, diam, diam);
  }
}
