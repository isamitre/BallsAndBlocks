//Rules Screen
class Rules{
  Button menuBtn;
  
  public Rules(){
    menuBtn = new Button(width*0.95, 30, 30, 30, "—\n—\n—");
  }
  public void display(){
    // menu button
    menuBtn.display();
  }
  
  // returns what currScreen should be
  public String updateScreen(String currScreen) {
    if (menuBtn.mouseOver()) {
      return "menu";
    }
    return currScreen;
  }
}
