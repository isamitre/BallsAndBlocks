class Play {

  Player p;
  Button pauseBtn;
  float y, x, vy, g;
  int time;
  float spawnTime;
  int numDisplayedBlocks;
  Block[] blocks = new Block[10];
  
  public Play() {
    p = new Player(width/2, height*0.8);
    pauseBtn = new Button(width*0.9, 30, 35, 35, "||");
    y = 50;
    x = width/2;
    vy = 0;
    g = 0.5;
    time = millis();
    spawnTime = 10;
    numDisplayedBlocks = 0;
    // create blocks
    for (int i = 0; i < blocks.length; i++) {
      blocks[i] = new Block(random(30, width-30), random(0, height/3));
    }
  }

  public void display() {
    background(255);
    rectMode(CENTER);
    fill(#A8FF9D);
    rect(width/2, height, width, height/2);

    y += vy + g/2;
    vy +=g;
    println("velocity: "+vy);
    println("y: "+y);
    fill(0);
    ellipse(x, y, 50, 50);

    //bouncing
    if (y + 25>=height) {
      text("GAME OVER", width/2, height/2);
      if (mouseX == width/2 && mouseY == height/2)
      {
        gameRestart();
      }
    } else if (y + 25>=mouseY && x>mouseX-25 && x<mouseX+25 && vy>0) {
      vy = -13;
      y = mouseY-25;
    }

    rect(mouseX, mouseY, 50, 10);
    
    displayBlocks();
    int elapsedTime = millis() - time;
    if (numDisplayedBlocks < 10 && elapsedTime > spawnTime*1000) {
      numDisplayedBlocks++;
      spawnTime = max(spawnTime/3, 2);
      time = millis();
    }
  }

  void gameRestart()
  {
    ellipse(x, y, 50, 50);
  }
  
  void displayBlocks() {
    for (int i = 0; i < numDisplayedBlocks; i++) {
      blocks[i].display();
    }
  }
}
