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

    textAlign(CENTER, CENTER);
    textSize(20);
}
  
  public void display() {
    if (mouseOver()) {
      fill(180);
    } else {
      fill(200);
    }
    ellipse(x, y, w, h);
    fill(0);
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
