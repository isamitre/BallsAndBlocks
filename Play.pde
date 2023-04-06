class Play {

  Player p;
  Button pauseBtn;
  Cat cat = new Cat(300, 50);
  int numBlocks;
  Block[] blocks = new Block[10];
  
  public Play() {
    p = new Player(width/2, height*0.8);
    pauseBtn = new Button(width*0.9, 30, 35, 35, "||");
    // create blocks
    for (int i = 0; i < blocks.length; i++) {
      blocks[i] = new Block(random(30, width-30), random(0, height/3));
    }
    numBlocks = 0;
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
  }

  
  void displayBlocks() {
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].display();
    }
  }
}
