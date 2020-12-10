class Fan {

//properties
  int baseHeight;
  int headX;
  int headY;
  int headSize;
  int move;
  int bodyH;
  int bodyW;
  color c;
  
  int numJumps;
  int yAdjust;
  
  boolean jump = false;

//constructor
  Fan (int spacing, int variation) {
    //adjust fan for variety
    if (variation == 0) {
      yAdjust = 0;
    }
    if (variation == 1) {
      yAdjust = 25;
    }
    if (variation == 2) {
      yAdjust = 16;
    }
    if (variation == 3) {
      yAdjust = 29;
    }
    
    baseHeight = height - 50;
    
    headY = baseHeight - yAdjust;
    headX = 200 + spacing;
    headSize = 70;
    
    int fat = yAdjust;
    bodyW = 50 + fat;
    bodyH = 100;
    move = 50;
    c = color (15, 0, 2*yAdjust);
    
    numJumps = 0;
  }

//display
  void display () {
    fill(c);
      circle(headX, headY, headSize);
      ellipse(headX, headY + 60, bodyW, bodyH);
    
}

//jump
  void jump () {
    headY -= move;
    numJumps++;
    
    if (headY > height - 80) {
      //for (int i = 0; i < 300000; i += 0.1) {
      // // i-=0.01;
      //}
    move *= -1;   
    }

    if (headY < (height - 99)) {
      move *= -1;
    }

    if (numJumps > 5) {
      this.jump = false;
      numJumps = 0;
    }
  }
}
