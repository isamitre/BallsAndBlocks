class Play {

  Cat cat;
  Button pauseBtn;
  float barX, barY;
  
  int blockTimer;
  int blockSpawnTime;
  int minBlockSpawnTime;
  int maxBlocks;
  ArrayList<Block> blocks;
  
  PImage hand;
  PImage bg;
  boolean isEasy;


  public Play(boolean isEasy) {
    this.isEasy = isEasy;
    
    barX = 100;
    barY = 40;

    pauseBtn = new Button(width*0.9, 30, 35, 35, "||");
    cat = new Cat(300, 50, barX, barY);
    
    blockTimer = millis();
    if (isEasy) {
      // easy mode
      blockSpawnTime = 10;
      minBlockSpawnTime = 2;
      maxBlocks = 10;
    } else {
      // hard mode
      blockSpawnTime = 6;
      minBlockSpawnTime = 1;
      maxBlocks = 15;
    }
    blocks = new ArrayList<Block>();
    
    hand = loadImage("hand.png");
    bg = loadImage("ocean-background.png");
  }

  public void display() {
    // background
    imageMode(CORNER);
    image(bg, 0, 0, width, height);

    // player-controlled hand
    imageMode(CENTER);
    image(hand, mouseX, mouseY, barX, barY);

    //  cat
    cat.update();
    cat.display();

    // block handling
    handleBlocks();
  }
  
  void updateDifficulty(boolean isEasy) {
    this.isEasy = isEasy;
    cat.isEasy = isEasy;
  }

  void handleBlocks() {
    displayBlocks();
    handleBlockCollisions(cat);
  }

  void displayBlocks() {
    rectMode(CORNER);
    // time handling inspired by
    // https://stackoverflow.com/questions/12417937/create-a-simple-countdown-in-processing
    
    // blocks appear every blockSpawnTime
    int elapsedTime = millis() - blockTimer;
    if (elapsedTime > blockSpawnTime*1000) {
      if (blocks.size() < maxBlocks ) {
        // add block
        blocks.add(new Block(random(30, width-30), random(30, height/3)));
        // blockSpawnTime decreases until it is 2 seconds
        blockSpawnTime = max(blockSpawnTime/3, 2);
      } else {
        // remove block
        blocks.remove(0);
      }
      // reset blockTimer
      blockTimer = millis();
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
        && (currCat.y+currCat.diam/2) >= currBlock.y
        && (currCat.y-currCat.diam/2) <= (currBlock.y+currBlock.diam)) {
        currCat.vy = -currCat.vy;
      }
      // horizontal block collision with cat, change cat's x direction
      if ( (currCat.y+currCat.diam/2) >= currBlock.y
        && (currCat.y-currCat.diam/2) <= (currBlock.y+currBlock.diam)
        && (currCat.x+currCat.diam/2) >= currBlock.x
        && (currCat.x-currCat.diam/2) <= (currBlock.x+currBlock.diam)) {
        currCat.vx = -currCat.vx;
      }
    }
  }
}
