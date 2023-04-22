//Rules Screen
class Rules {
  Button menuBtn;
  PImage hand;
  PImage cat;
  Treat treat;

  ArrayList<String> rules;

  int rulesStartY = height/4;
  int barX = 100;
  int barY = 40;

  // Rules constructor
  public Rules() {
    menuBtn = new Button(width*0.95, 30, 30, 30, "—\n—\n—");

    // how to play instructions/rules
    rules = new ArrayList<>();
    rules.add("Move the hand with your mouse. \nPress 'a' to rotate the hand left and\n'd' to rotate the hand right ");
    rules.add("Prevent the cat from falling in the water by \nletting it bounce on your hand.");
    rules.add("Make the cat happy by getting treats! This will \nincrease your points.");
    rules.add("If you score high enough, you'll get to go on the \nleaderboard!");
    rules.add("Pause by pressing the spacebar.");

    // images
    hand = loadImage("hand.png");
    cat = loadImage("cat1.png");
    treat = new Treat(490, 220);
  }

  // displays Rules screen
  public void display() {
    rectMode(CENTER);

    // menu button
    menuBtn.display();

    // outer rectangle
    fill(255, 70);
    strokeWeight(3);
    rect(width/2, height/2, width*0.8, height*0.8, 20);

    // how to play text rectangle
    fill(#8fb8ea);
    rect(width/2, height*0.1, 150, 50, 20);
    textAlign(CENTER, CENTER);
    fill(0);
    text("HOW TO PLAY", width/2, height*0.09);

    // explain how to play
    textLeading(25);
    textAlign(LEFT);
    text(rules.get(0), width*0.15, rulesStartY);
    text(rules.get(1), width*0.15, rulesStartY+40*2);
    text(rules.get(2), width*0.15, rulesStartY+40*3+15);
    text(rules.get(3), width*0.15, rulesStartY+40*4+15*2);
    text(rules.get(4), width*0.15, rulesStartY+40*5+15*3);

    // example images
    imageMode(CENTER);
    image(hand, 435, 105, barX*0.7, barY*0.7);  // hand
    image(cat, 490, 180, 25, 25);               // cat
    treat.display();                            // treat
  }

  // returns what currScreen should be
  public String updateScreen(String currScreen) {
    if (menuBtn.mouseOver()) {
      return "menu";
    }
    return currScreen;
  }
}
