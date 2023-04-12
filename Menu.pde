class Menu {
  Button playBtn;
  Button diffBtn;
  Button leaderboardBtn;
  boolean isEasy;

  public Menu() {
    playBtn = new Button(width/2, height/5, 100, 50, "play");
    diffBtn = new Button(width/2, height/2, 70, 40, "easy");
    leaderboardBtn = new Button(width/2, height*.7, 140, 50, "leaderboard");
    isEasy = true;
  }

  public void display() {
    strokeWeight(1);
    rectMode(CENTER);
    // play button
    playBtn.display();
    // difficulty button
    diffBtn.display();
    // leaderboard button
    leaderboardBtn.display();
  }

  // returns what currScreen should be
  public String updateScreen(String currScreen) {
    if (playBtn.mouseOver()) {
      return "play";
    }
    if (leaderboardBtn.mouseOver()) {
      return "leaderboard";
    }
    if (diffBtn.mouseOver()) {
      changeDifficulty();
    }
    return currScreen;
  }

  public void changeDifficulty() {
    // change difficulty from easy to hard
    if (diffBtn.text == "easy") {
      diffBtn.text = "hard";
      isEasy = false;
    }
    // change difficulty from hard to easy
    else if (diffBtn.text == "hard") {
      diffBtn.text = "easy";
      isEasy = true;
    }
  }
}
