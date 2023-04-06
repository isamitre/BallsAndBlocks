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
    
    rectMode(CORNER);
    // block handling
    displayBlocks();
    int elapsedTime = millis() - time;
    if (elapsedTime > spawnTime*1000) {
      if (blocks.size() < maxBlocks ) {
        // add block
        blocks.add(new Block(random(30, width-30), random(0, height/3)));
        spawnTime = max(spawnTime/3, 2);
        time = millis();
      } else {
        // remove block
        blocks.remove(0);
        time = millis();
      }
    } 
  }
  
  void displayBlocks() {
    for (int i = 0; i < blocks.size(); i++) {
      blocks.get(i).display();
    }
  }
}
