Menu menu;
Play play;
Pause pause;
Leaderboard leaderboard;
Rules rules;
String currScreen;
PImage im;
color[] colors = new color[]{#355070, #6D5976, #B56576, #E56B6F, #EAAC8B};
SoundFile treatSound;

void setup() {
  size(600, 400);
  currScreen = "menu";

  treatSound = new SoundFile(this, "powerup.wav");

  menu = new Menu();
  leaderboard = new Leaderboard();
  play = new Play(true, leaderboard, treatSound);
  rules = new Rules();
  pause = new Pause();
  im = loadImage("ocean-background.png");
}

void draw() {
  imageMode(CORNER);
  image(im, 0, 0, width, height);

  // set current screen to main menu
  if (currScreen == "menu") {
    menu.display();
  }
  // set current screen to play mode
  else if (currScreen == "play") {
    play.display();
    play.updateDifficulty(menu.isEasy);
  }
  // set current screen to pause mode
  else if (currScreen == "pause") {
    pause.display();
  } else if (currScreen == "rules") {
    rules.display();
  }
  // set current screen to leaderboard page
  else if (currScreen == "leaderboard") {
    leaderboard.display();
  }
  // set current screen to gameover page
  else if (currScreen == "gameover") {
    background(#B76B6C);
    text("GAMEOVER :(", width/2, height/2);
  }
}

void keyPressed() {
  if (currScreen == "play") {
    // set screen to pause if spacebar is pressed
    if (key == ' ') {
      currScreen = "pause";
    }
    // allow user to type username if gameover
    if (play.gameover) {
      play.typeUsername();
    }
  }
}

void mousePressed() {
  // menu screen button functionality
  if (currScreen == "menu") {
    currScreen = menu.updateScreen(currScreen);
    // reset play if coming from menu
    if (currScreen == "play") {
      play = new Play(menu.isEasy, leaderboard, treatSound);
    }
  }

  // pause screen button functionality
  if (currScreen == "pause") {
    currScreen = pause.updateScreen(currScreen);
  }

  // play screen button functionality
  if (currScreen == "play") {
    currScreen = play.updateScreen(currScreen);
    // reset play
    if (currScreen == "play2") {
      play = new Play(menu.isEasy, leaderboard, treatSound);
      currScreen = "play";
    }
  }
  // rules screen button functionality
  if (currScreen == "rules") {
    currScreen = rules.updateScreen(currScreen);
  }
  // leaderboard screen button functionality
  if (currScreen == "leaderboard") {
    currScreen = leaderboard.updateScreen(currScreen);
  }
}
