class Grid {

  boolean[][] grid;

  public Grid() {
    grid = new boolean[30][11];
  }

  public boolean isSpaceOccupied(float x, float y) {
    int xi = int(x/20);
    int yi = int(y/20);

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        // check indices are in bounds
        if ((xi + i < 0) || (xi + i >= grid.length) || (yi + j < 0) || (yi + j >= grid[xi].length)) {
          continue;
        }
        // return true if space is occupied
        if (grid[xi+i][yi+j] == true) {
          return true;
        }
      }
    }

    // return false if space is not occupied
    return false;
  }

  public void setOccupancy(float x, float y, boolean isOccupied) {
    grid[int(x/20)][int(y/20)] = isOccupied;
  }

  public void printGrid() {
    int numItems = 0;
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == true) {
          numItems++;
          print("1 ");
        } else {
          print("0 ");
        }
      }
      println();
    }
    println("There are ", numItems, " items on the screen");
    println();
  }
}
