class Menu {
  Button playBtn;
  Button diffBtn;
  Button leaderboardBtn;

  public Menu() {
    playBtn = new Button(width/2, height/5, 100, 50, "play");
    diffBtn = new Button(width/2, height/2, 70, 40, "easy");
    leaderboardBtn = new Button(width/2, height*.7, 140, 50, "leaderboard");
  }

  public void display() {
    rectMode(CENTER);
    // play button
    playBtn.display();
    // difficulty button
    diffBtn.display();
    // leaderboard button
    leaderboardBtn.display();
  }

  public String update(String currScreen) {
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
    }
    // change difficulty from hard to easy
    else if (diffBtn.text == "hard") {
      diffBtn.text = "easy";
    }
  }
}
