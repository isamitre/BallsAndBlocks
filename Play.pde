class Play {

  Cat cat;
  Button pauseBtn;
  float y, x, vy, g;
  int time;
  float spawnTime;
  int maxBlocks;
  ArrayList<Block> blocks;


  public Play() {
    cat = new Cat(300, 50);
    pauseBtn = new Button(width*0.9, 30, 35, 35, "||");
    y = 50;
    x = width/2;
    vy = 0;
    g = 0.5;
    time = millis();
    spawnTime = 10;
    maxBlocks = 10;
    blocks = new ArrayList<Block>();
    Block newBlock = new Block(width/2, 20);
    blocks.add(newBlock);
  }

  public void display() {
    background(255);
    rectMode(CENTER);
    fill(#A8FF9D);
    rect(width/2, height, width, height/2);

    fill(0);

    rect(mouseX, mouseY, 50, 10);
    cat.update();
    cat.display();


    // block handling
    handleBlocks();
  }

  void handleBlocks() {
    displayBlocks();
    handleBlockCollisions(cat);
  }

  void displayBlocks() {
    rectMode(CORNER);
    // time handling inspired by
    // https://stackoverflow.com/questions/12417937/create-a-simple-countdown-in-processing
    // blocks appear every spawnTime
    int elapsedTime = millis() - time;
    if (elapsedTime > spawnTime*1000) {
      if (blocks.size() < maxBlocks ) {
        // add block
        blocks.add(new Block(random(30, width-30), random(30, height/3)));
        // spawnTime decreases until it is 2 seconds
        spawnTime = max(spawnTime/3, 2);
      } else {
        // remove block
        blocks.remove(0);
      }
      // reset timer
      time = millis();
    }

    // display blocks
    for (Block currBlock : blocks) {
      currBlock.display();
    }
  }

  void handleBlockCollisions(Cat currCat) {
    for (Block currBlock : blocks) {
      // vertical block collision with cat, change cat's y direction
      if ( (currCat.x+currCat.diam/2) >= currBlock.x
        && (currCat.x-currCat.diam/2) <= (currBlock.x+currBlock.diam)
        && (currCat.y >= currBlock.y)
        && currCat.y <= (currBlock.y+currBlock.diam)) {
        currCat.vy = -currCat.vy;
      }
      // horizontal block collision with cat, change cat's x direction
      if ( (currCat.y+currCat.diam/2) >= currBlock.y
        && (currCat.y-currCat.diam/2) <= (currBlock.y+currBlock.diam)
        && (currCat.x >= currBlock.x)
        && currCat.x <= (currBlock.x+currBlock.diam)) {
        //currCat.vx = -currCat.vx;
      }
    }
  }
}
