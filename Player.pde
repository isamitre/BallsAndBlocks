class Player {
  
  float x, y;
  float vy;
  float g;
  float speedX;
  
  public Player(float x, float y) {
    this.x = x;
    this.y = y;
    vy = 0;
    g = 0.5;
    speedX = 3;
  }
  
  public void display() {
    fill(0);
    ellipse(x, y, 50, 50);
  }
  
  public void update() {
    // based on 03/24 class code
    y += vy + g/2;
    vy += g;
    
    // bouncing
    if (y + 25 >= height) {
      vy = -vy;
    }
  }
  
  // moves player left
  public void moveLeft() {
    x -= speedX;
  }
  
  // moves player right
  public void moveRight() {
    x += speedX;
  }
}
