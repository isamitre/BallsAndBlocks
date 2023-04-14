class Play {

  Cat cat;
  float barX, barY;
  
  Button playAgainBtn;
  Button menuBtn;
  
  int points;
  String username;
  Leaderboard leaderboard;
  boolean addedToLeaderboard;
  
  int blockTimer;
  int blockSpawnTime;
  int minBlockSpawnTime;
  int maxBlocks;
  ArrayList<Block> blocks;
  
  ArrayList<Treat> treats;
  
  PImage hand;
  PImage bg;
  boolean isEasy;
  boolean gameover;


  public Play(boolean isEasy, Leaderboard leaderboard) {
    this.isEasy = isEasy;
    gameover = false;
    
    points = 0;
    username = "";
    this.leaderboard = leaderboard;
    addedToLeaderboard = false;
    
    barX = 100;
    barY = 40;

    playAgainBtn = new Button(width/2, height*.45, 100, 45, "play again");
    menuBtn = new Button(width/2, height*.6, 120, 45, "main menu");
    cat = new Cat(300, 50, barX, barY, isEasy);
    
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
    
    treats = new ArrayList<Treat>();
    treats.add(new Treat(random(20, width-20), random(0, height/2)));
    treats.add(new Treat(random(20, width-20), random(0, height/2)));
    treats.add(new Treat(random(20, width-20), random(0, height/2)));
    
    hand = loadImage("hand.png");
    bg = loadImage("ocean-background.png");
  }

  public void display() {
    // background
    imageMode(CORNER);
    image(bg, 0, 0, width, height);

    // player-controlled hand
    if (!gameover) {
      imageMode(CENTER);
      image(hand, mouseX, mouseY, barX, barY);
    }

    //  cat
    cat.update();
    cat.display();

    // block handling
    handleBlocks();
    
    // treat handling
    handleTreats();
    
    //display score
    fill(0);
    textAlign(CORNER);
    text("Score: " + points, 5, height-10);
    
    // gameover
    gameover = cat.gameover;
    if (gameover) {
      rectMode(CENTER);
      strokeWeight(3);
      fill(#8fb8ea, 240);
      rect(width/2, height/2, width*0.6, height*0.6, 20);
      
      fill(0);
      text("GAMEOVER!", width/2, height*0.3);
      
      if (!addedToLeaderboard && leaderboard.topEntries.size() < leaderboard.maxPlayers || leaderboard.getLastEntry().getPoints() < points) {
        textAlign(CENTER);
        textLeading(20);
        
        // option of adding to leaderboard
        text("Congrats! You're in the top " + leaderboard.maxPlayers + ". ", width/2, height*0.4);
        text("Add your username to the leaderboard!", width/2, height*0.48);
        text("Type username here: ", width/2, height*0.56);
        
        // where to type username
        fill(250);
        strokeWeight(1);
        rect(width/2, height*0.64, width*0.3, 40, 10);
        fill(0);
        text(username, width/2, height*0.66);
      } else {
        // display buttons
        playAgainBtn.display();
        menuBtn.display();
      }
    }
  }
  
  // returns what currScreen should be
  public String updateScreen(String currScreen) {
    if ( !(!addedToLeaderboard && leaderboard.topEntries.size() < leaderboard.maxPlayers || leaderboard.getLastEntry().getPoints() < points)) {
      if (playAgainBtn.mouseOver()) {
        return "play2";
      } 
      if (menuBtn.mouseOver()) {
        return "menu";
      }
    }
    return currScreen;
  }
  
  public void typeName() {
    if (key >= 'a' && key <= 'z' || key >= '0' && key <= '9') {
      username = username+key;
    }
    if (keyCode == 8) {
      if (username.length() > 0) {
        username = username.substring(0, username.length()-1);
      }
    }
    if (keyCode == ENTER) {
      leaderboard.addEntry(username, points);
      addedToLeaderboard = true;
    }
  }
  
  void updateDifficulty(boolean isEasy) {
    this.isEasy = isEasy;
    cat.isEasy = isEasy;
  }

  void handleBlocks() {
    if (!gameover) {
      displayBlocks();
      handleBlockCollisions(cat);
    }
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
  
  void handleTreats(){
    for (Treat treat : treats) {
      treat.display();
    }
    handleTreatCollision(cat);
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
  
  void handleTreatCollision(Cat currCat){
    for (int i=0; i<treats.size(); i++) {
      if(treats.get(i).isHittingTreat(currCat))
      {
        treats.remove(i);
        points++;
        treats.add(new Treat(random(20, width-20), random(0, height/2)));
      }
    }
  }
}
