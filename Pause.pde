class Pause {

  PImage im;
  Button gameBtn;
  Button muteBtn;
  Button menuBtn;
  boolean volumeOn;

  // Pause constructor
  public Pause() {
    gameBtn  = new Button(width/2, height*.3, 130, 45, "back to game");
    muteBtn = new Button(width/2, height*0.45, 80, 45, "mute");
    menuBtn = new Button(width/2, height*.6, 115, 45, "main menu");
    im = loadImage("ocean-background.png");
    im.filter(BLUR, 6);
    volumeOn = true;
  }

  // displays Pause screen
  public void display() {
    background(255);
    image(im, 0, 0, width, height);
    rectMode(CENTER);
    gameBtn.display();
    muteBtn.display();
    menuBtn.display();
  }

  // returns what currScreen should be
  public String updateScreen(String currScreen) {
    if (gameBtn.mouseOver()) {
      return "play";
    }
    if (muteBtn.mouseOver()) {
      changeMute();
    }
    if (menuBtn.mouseOver()) {
      return "menu";
    }
    return currScreen;
  }

  public void changeMute() {
    // change volume from on to off
    if (muteBtn.text == "mute") {
      muteBtn.text = "unmute";
      volumeOn = false;
    }
    // change volume from off to on
    else if (muteBtn.text == "unmute") {
      muteBtn.text = "mute";
      volumeOn = true;
    }
  }
}
