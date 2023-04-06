class Play {

  Player p;
  Button pauseBtn;
  Cat cat;
  int numBlocks;
  Block[] blocks = new Block[10];
  float barX, barY;
  
  public Play() {
    p = new Player(width/2, height*0.8);
    pauseBtn = new Button(width*0.9, 30, 35, 35, "||");
    // create blocks
    for (int i = 0; i < blocks.length; i++) {
      blocks[i] = new Block(random(30, width-30), random(0, height/3));
    }
    numBlocks = 0;
    barX = 100;
    barY = 20;
    cat = new Cat(300, 50, barX, barY);
  }

  public void display() {
    background(255);
    rectMode(CENTER);
    fill(#A8FF9D);
    rect(width/2, height, width, height/2);

    fill(0);

    rect(mouseX, mouseY, barX, barY);
    cat.update();
    cat.display();
    displayBlocks();
  }

  
  void displayBlocks() {
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].display();
    }
  }
}
