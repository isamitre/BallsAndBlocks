class Play {

  Player p;
  Button pauseBtn;
  Cat cat = new Cat(300, 50);
  
  public Play() {
    p = new Player(width/2, height*0.8);
    pauseBtn = new Button(width*0.9, 30, 35, 35, "||");
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
  }

}
