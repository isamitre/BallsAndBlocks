class Menu {
  Button playBtn;
  Button diffBtn;
  Button rulesBtn;
  Button leaderboardBtn;
  boolean isEasy;

  public Menu() {
    playBtn = new Button(width/2, height/5, 100, 50, "play");
    diffBtn = new Button(width/2, height/3, 140, 40, "difficulty: easy");
    rulesBtn = new Button(width/2, height*.55, 70, 40, "rules");
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
    // instruction button
    rulesBtn.display();
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
    if (rulesBtn.mouseOver()){
      return "rules";
    }
    if (diffBtn.mouseOver()) {
      changeDifficulty();
    }
    return currScreen;
  }

  public void changeDifficulty() {
    // change difficulty from easy to hard
    if (diffBtn.text == "difficulty: easy") {
      diffBtn.text = "difficulty: hard";
      isEasy = false;
    }
    // change difficulty from hard to easy
    else if (diffBtn.text == "difficulty: hard") {
      diffBtn.text = "difficulty: easy";
      isEasy = true;
    }
  }
}
