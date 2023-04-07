Menu menu;
Play play;
Pause pause;
String currScreen;
PImage im;
color[] colors = new color[]{#355070, #6D5976, #B56576, #E56B6F, #EAAC8B};

void setup() {
  size(600, 400);
  currScreen = "menu";

  menu = new Menu();
  play = new Play(true);
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
  else if (currScreen == "pause") {
    pause.display();
  }
  // set current screen to leaderboard page
  else if (currScreen == "leaderboard") {
    background(#6B7BB7);
    text("LEADERBOARD", width/2, height/2);
  }
  // set current screen to gameover page
  else if (currScreen == "gameover") {
    background(#B76B6C);
    text("GAMEOVER :(", width/2, height/2);
  }
}

void keyPressed() {
  if (currScreen == "play" && key == ' ') {
    currScreen = "pause";
  }
}

void mousePressed() {
  // menu's button functionality
  if (currScreen == "menu") {
    currScreen = menu.update(currScreen);
    // reset play if coming from menu
    if (currScreen == "play") {
      play = new Play(menu.isEasy);
    }
  }
  
  // pause's button functionality
  if (currScreen == "pause") {
    currScreen = pause.update(currScreen);
  }
}
