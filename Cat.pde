class Cat {
  float x, y, vy, vx, g;
  float speed;
  float diam;
  float angle;
  PImage icon;
  float barX, barY, barR;
  float spinSpeed;
  boolean isEasy;
  boolean gameover;
  boolean volumeOn;
  SoundFile hitSound;

  // Cat constructor
  public Cat(float x, float y, float bx, float by, float br, boolean isEasy, SoundFile hitSound) {
    this.x = x;
    this.y = y;
    barX = bx;
    barY = by;
    barR = br;
    this.isEasy = isEasy;
    this.hitSound = hitSound;
    this.hitSound.amp(0.5);
    volumeOn = true;
    gameover = false;
    // update Difficulty
    if (isEasy)
    {
      g = 0.3;
      speed = -10;
      spinSpeed = 0.1;
    } else {
      g = 0.4;
      speed = -15;
      spinSpeed = 0.3;
    }
    vy = 0;
    vx = 0;
    diam = 25;
    angle = random(0, TWO_PI);
    icon = loadImage("cat1.png");
  }

  // update cat location and check for bar/wall collisions
  void update(float br) {
    y += vy;
    vy +=g;
    x += vx;
    
    barR = br;
    
    //calculate rotation
    PVector[] vertices = createBarVertices(barX, barY, barR);

    Boolean collider = handleBarCollision(vertices, x, y);
    if (y + diam >=height) {
      gameover = true; //IS THIS NECESSARY?
    } 
     else if (collider) {
      vy = speed;
      y = mouseY-barY/2-diam/2;
      //vx = map(x, mouseX-barX/2, mouseX+barX/2, -5, 5);
      vx = (barR*(PI/36))*10;
    }

    //Wall collision
    if ((x-diam/2) <= 0 || (x+diam/2) >= width) {
      vx = -vx;
    }

    //Add angle to have cat rotating
    angle += spinSpeed;
  }

  //Draw the cat
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    imageMode(CENTER);
    image(icon, 0, 0, diam, diam);
    popMatrix();
  }
  PVector[] createBarVertices(float barX, float barY, float barR)
  {
    PVector[] vertices = new PVector[4];
    float sinVal = sin(barR*(PI/36));
    float cosVal = cos(barR*(PI/36));
    
    float xR = ((mouseX+barX/2)-mouseX)*cosVal - ((mouseY-barY/2-10)-mouseY)*sinVal;
    float yR = ((mouseY-barY/2-10)-mouseY)*cosVal + ((mouseX+barX/2)-mouseX)*sinVal;
    vertices[0] = new PVector(xR+mouseX,yR+mouseY);
     xR = ((mouseX-barX/2)-mouseX)*cosVal - ((mouseY-barY/2-10)-mouseY)*sinVal;
     yR = ((mouseY-barY/2-10)-mouseY)*cosVal + ((mouseX-barX/2)-mouseX)*sinVal;
    vertices[1] = new PVector(xR+mouseX,yR+mouseY);
     xR = ((mouseX+barX/2)-mouseX)*cosVal - ((mouseY+barY/2-10)-mouseY)*sinVal;
     yR = ((mouseY+barY/2-10)-mouseY)*cosVal + ((mouseX+barX/2)-mouseX)*sinVal;
    vertices[2] = new PVector(xR+mouseX,yR+mouseY);
     xR = ((mouseX-barX/2)-mouseX)*cosVal - ((mouseY+barY/2-10)-mouseY)*sinVal;
     yR = ((mouseY+barY/2-10)-mouseY)*cosVal + ((mouseX-barX/2)-mouseX)*sinVal;
    vertices[3] = new PVector(xR+mouseX,yR+mouseY);
    return vertices;
  }
  Boolean handleBarCollision(PVector[] vertices, float px, float py)
  {
    boolean collides = false;
    int next = 0;
    for (int i=0; i<vertices.length; i++) {
      if (next == vertices.length-1) 
      {
        next = 0;
      }
      else
      {
        next = i+1;
      }
      PVector vNext = vertices[next];
      PVector vCurrent = vertices[i];      
      if (((vCurrent.y >= py && vNext.y < py) || (vCurrent.y < py && vNext.y >= py)) && (px < (vNext.x-vCurrent.x)*(py-vCurrent.y) / (vNext.y-vCurrent.y)+vCurrent.x)) {
              collides = !collides;
      }
    }
    return collides;
    
  }
  
  // change cat direction based on block collisions
  void handleBlockCollisions(ArrayList<Block> blocks) {
    for (Block currBlock : blocks) {
      // is hitting block
      if ( (x+diam/2) >= currBlock.x
        && (x-diam/2) <= (currBlock.x+currBlock.diam)
        && (y+diam/2) >= currBlock.y
        && (y-diam/2) <= (currBlock.y+currBlock.diam)) {

        float verticalCheck = min(abs(y+diam/2-currBlock.y), abs(y-diam/2-(currBlock.y+currBlock.diam)));
        float horizontalCheck = min(abs(x+diam/2-currBlock.x), abs(x-diam/2-(currBlock.x+currBlock.diam)));

        // bounced off a corner, change cat's x and y direction
        if (abs(verticalCheck - horizontalCheck) <= 3) {
          vx = -vx;
          vy = -vy;
        }
        // vertical block collision with cat, change cat's y direction
        else if (verticalCheck < horizontalCheck) {
          vy = -vy;
        }
        // horizontal block collision with cat, change cat's x direction
        else {
          vx = -vx;
        }

        if (volumeOn) {
          // play hit sound
          hitSound.play();
        }
      }
    }
  }
}
