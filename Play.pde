class Play {

  Button pauseBtn;
<<<<<<< HEAD
  float y, x, vy, g;
  int time;
  float spawnTime;
  int numDisplayedBlocks;
=======
  Cat cat = new Cat(300, 50);
  int numBlocks;
>>>>>>> main
  Block[] blocks = new Block[10];
  
  public Play() {
    pauseBtn = new Button(width*0.9, 30, 35, 35, "||");
<<<<<<< HEAD
    y = 50;
    x = width/2;
    vy = 0;
    g = 0.5;
    time = millis();
    spawnTime = 10;
    numDisplayedBlocks = 0;
=======
>>>>>>> main
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

    fill(0);

    rect(mouseX, mouseY, 50, 10);
    cat.update();
    cat.display();
    displayBlocks();
    int elapsedTime = millis() - time;
    if (numDisplayedBlocks < 10 && elapsedTime > spawnTime*1000) {
      numDisplayedBlocks++;
      spawnTime = max(spawnTime/3, 2);
      time = millis();
    }
  }

  
  void displayBlocks() {
    for (int i = 0; i < numDisplayedBlocks; i++) {
      blocks[i].display();
    }
  }
}
