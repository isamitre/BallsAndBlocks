// modeled after Button processing example
// https://processing.org/examples/button.html

class Button {
  float x, y;
  float w, h;
  String text;

  public Button(float x, float y, float w, float h, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
}
  
  public void display() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(20);
    strokeWeight(1);
    
    if (mouseOver()) {
      fill(220, 220, 255);
    } else {
      fill(255);
    }
    rect(x, y, w, h, 20);
    fill(0);
    if (text == "—\n—\n—") {
      // only applies to menu button in Leaderboard
      textLeading(5);
    }
    text(text, x, y-3);
  }
  
  public boolean mouseOver() {
    float distX = x - mouseX;
    float distY = y - mouseY;
    float ellipseEquation = pow(distX/(w/2), 2) + pow(distY/(h/2), 2);
    if (ellipseEquation <= 1) {
      return true;
    }
    return false;
  }
  
}
