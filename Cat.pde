class Cat {
  float x, y, vy, g;
  float diam;
  float angle;
  PImage icon;
  float barX, barY;
  public Cat(float x, float y, float bx, float by) {
    this.x = x;
    this.y = y;
    barX = bx;
    barY = by;
    g = 0.3;
    vy = 0;
    diam = 25;
    angle = random(0, TWO_PI);
    icon = loadImage("cat1.png");
  }
  
  void update(){
    y += vy;
    vy +=g;
    
    if (y + diam >=height) {
      text("GAME OVER", width/2, height/2);
    } 
    else if (y + diam/2>= mouseY-barY/2-10 && y + diam/2 <= mouseY+barY/2+10 
    && x>=mouseX-barX/2 && x<=mouseX+barX/2 && vy>0) {
      vy = -10;
      y = mouseY-barY/2-diam/2;
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
