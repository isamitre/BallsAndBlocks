class Pause {

  PImage im;
  Button gameBtn;
  Button menuBtn;

  // Pause constructor
  public Pause() {
    gameBtn  = new Button(width/2, height*.3, 130, 50, "back to game");
    menuBtn = new Button(width/2, height*.6, 100, 50, "main menu");
    im = loadImage("ocean-background.png");
    im.filter(BLUR, 6);
  }

  // displays Pause screen
  public void display() {
    background(255);
    image(im, 0, 0, width, height);
    rectMode(CENTER);
    gameBtn.display();
    menuBtn.display();
  }

  // returns what currScreen should be
  public String updateScreen(String currScreen) {
    if (gameBtn.mouseOver()) {
      return "play";
    }
    if (menuBtn.mouseOver()) {
      return "menu";
    }
    return currScreen;
  }
}
