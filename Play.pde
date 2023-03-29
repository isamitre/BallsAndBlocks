class Play {
  
  Player p;
  Button pauseBtn;
  
  public Play() {
    p = new Player(width/2, height*0.8);
    pauseBtn = new Button(width*0.9, 30, 35, 35, "||");
  }
  
  public void display() {
    background(#6BB786);
    text("PLAY", width/2, 20);
    p.display();
    pauseBtn.display();
  }
  
  public void update() {
    p.update();
  }
  
  public void moveLeft() {
    p.moveLeft();
  }
  
  public void moveRight() {
    p.moveRight();
  }
}
