class Cat {
  float x, y, vy, g;
  float diam;
  float angle;
  PImage icon;
  public Cat(float x, float y) {
    this.x = x;
    this.y = y;
    g = 0.5;
    vy = 0;
    diam = 25;
    angle = random(0, TWO_PI);
    icon = loadImage("cat1.png");
  }
  
  void update(){
    y += vy + g/2;
    vy +=g;
    
    if (y + diam/2 >=height) {
      text("GAME OVER", width/2, height/2);
    } else if (y + diam/2>=mouseY && x>mouseX-diam/2 && x<mouseX+diam/2 && vy>0) {
      vy = -13;
      y = mouseY-diam/2;
    }
    
    angle += 0.05;
    
  }
  void display(){
    pushMatrix();
    translate(x, y);
    rotate(angle);
    imageMode(CENTER);
    image(icon, 0, 0, diam, diam);
    popMatrix();
  }
}
