class Controller extends PApplet {

//properties
  Scoreboard parent;
  float sliderTime = 200;
  int nameTagX;

//constructor 
  Controller(Scoreboard myParent) {
    parent = myParent;
  }
  
  void settings() {
    size(400, 600);
  }
  
  void setup() {
    surface.setTitle("Controller");
  }
  
  void draw() {
    background(255);
    fill(0);
    
    //player point buttons
    for (int i = 1; i < players.size()+1; i++) {
        Score player = players.get(i-1);
        fill(0);
        rect(30, i*60, 100, 40);
      textFont(nameFont);
      fill(255);
      textSize(20);
        text(player.name, 80, 28+(i*60));
        
      fill(0);
        circle(160, 20+(i*60), 30);
        circle(195, 20+(i*60), 30);
        circle(285, 20+(i*60), 30);
        circle(320, 20+(i*60), 30);
        circle(355, 20+(i*60), 30);
        
      textFont(controllerFont);
      textSize(18);
      fill(255);
        text("0", 160, 26+(i*60));
        text("-1", 195, 26+(i*60));
        text("+1", 285, 26+(i*60));
        text("+5", 320, 26+(i*60));
        text("+10", 355, 26+(i*60));
        
      textFont(scoreFont);
      textSize(32);
      fill(0);
        text(parent.getPoints(i), 240, 33+(i*60));
        
      //restart button   
        rect(0, 560, 400, 40);     
      fill(255);
      textFont(controllerFont);
      textSize(18);
        text("Restart", 200, 585);
    }
    fill(0);

    circle(20, 80, 10);
    if (players.size() > 1) {
      circle(20, 140, 10);
    }
    if (players.size() > 2) {
      circle(20, 200, 10);
    }
    if (players.size() > 3) {
      circle(20, 260, 10);
    }
    
    //add or subtract player
    fill(0);
      rect(10, 350, 170, 50);
      rect(190, 350, 200, 50);
    textFont(controllerFont, 30);
    fill(255);
      text("+ Add Player", 100, 387);
      text("- Remove Player", 290, 387);
    
    //timer buttons
    //start stop buttons
    fill(0);
      rect (115, 500, 75, 30);
      rect (215, 500, 75, 30);
    fill(255);
    textFont(controllerFont, 34);
    textAlign(CENTER);
      text("Start", 153, 525);
      text("Stop", 253, 525);
      
   //add or subtract time buttons
   fill(0);
     circle(30, 475, 35);
     circle(70, 475, 35);
     circle(330, 475, 35);
     circle(370, 475, 35);
     
   fill(255);
   textSize(18);
     text("- 10", 30, 480);
     text("- 1", 70, 480);
     text("+ 1", 330, 480);
     text("+ 10", 370, 480);
     
   //time slider
     rect(100, 475, 200, 5);
     fill(0);
     for (int i = 0; i < 5; i ++) {
       rect(100+(50*i), 475, 5, 10);
       
       textSize(15);
         text(i*15, 102+(50*i), 470);
     }
     circle(sliderTime, 475, 30);
     
   textSize(24);
   
   //change background buttons
     circle(100, 33, 30);
       image(footballIcon, 89, 23, 20, 20);
     circle(140, 33, 30);
       image(basketballIcon, 130, 23, 20, 20);
     circle(180, 33, 30);
       image(soccerIcon, 170, 23, 20, 20);
   fill(#EA9007);
     circle(220, 33, 30);
   fill(#FF7979);
     circle(260, 33, 30);
   fill(0);
     circle(300, 33, 30);
     
   text("Press any key to celebrate!", 200, 554);
  }
  
  void mousePressed () {
    //add/subtract points
    for (int i = 0; i < players.size(); i++) {
      Score player = players.get(i);
      if (mouseX > 145 && mouseX < 175 && mouseY > (20+((i+1)*60))-15 && mouseY < (20+((i+1)*60))+15) {
        circle(160, 20+((i+1)*60), 30);
        player.resetPoints();
      }
      if (mouseX > 180 && mouseX < 210 && mouseY > (20+((i+1)*60))-15 && mouseY < (20+((i+1)*60))+15) {
        circle(195, 20+((i+1)*60), 30);
        player.changePoints(-1);
      }
      if (mouseX > 270 && mouseX < 300 && mouseY > (20+((i+1)*60))-15 && mouseY < (20+((i+1)*60))+15) {
        circle(285, 20+((i+1)*60), 30);
        player.changePoints(1);
      }
      if (mouseX > 305 && mouseX < 335 && mouseY > (20+((i+1)*60))-15 && mouseY < (20+((i+1)*60))+15) {
        circle(320, 20+((i+1)*60), 30);
        player.changePoints(5);
      }
      if (mouseX > 340 && mouseX < 370 && mouseY > (20+((i+1)*60))-15 && mouseY < (20+((i+1)*60))+15) {
        circle(355, 20+((i+1)*60), 30);
        player.changePoints(10);
      }
    }
    
    //customizr player names
    if (mouseX > 15 && mouseX < 25 && mouseY > 75 && mouseY < 85) {
        Score player = players.get(0);
        circle(20, 80, 10);
        player.name = "Aaron";
    }
    if (mouseX > 15 && mouseX < 25 && mouseY > 135 && mouseY < 145) {
        Score player = players.get(1);
        circle(20, 140, 10);
        player.name = "Kish";
    }       
    if (mouseX > 15 && mouseX < 25 && mouseY > 195 && mouseY < 205) {
        Score player = players.get(2);
        circle(20, 200, 10);
        player.name = "David";
    }  
    if (mouseX > 15 && mouseX < 25 && mouseY > 255 && mouseY < 265) {
        Score player = players.get(3);
        circle(20, 260, 10);
        player.name = "Jeff";
    }  
              
    //add/remove player functions
    if (mouseX > 10 && mouseX < 180 && mouseY > 350 && mouseY < 400) {
      parent.addPlayer();
    }
    if (mouseX > 190 && mouseX < 390 && mouseY > 350 && mouseY < 400) {
      parent.removePlayer();
    }
      
    //start/stop timer functions
    if (mouseX > 115 && mouseX < 190 && mouseY > 500 && mouseY < 530) {
      clock.startTimer();
    }
    if (mouseX > 215 && mouseX < 290 && mouseY > 500 && mouseY < 530) {
      clock.stopTimer();
    }
    
    //change time functions
    if (mouseX > 12.5 && mouseX < 47.5 && mouseY > 457.5 && mouseY < 492.5) {
      circle(30, 475, 35);
      clock.addTime(-10, 0);
    }
    if (mouseX > 52.5 && mouseX < 87.5 && mouseY > 457.5 && mouseY < 492.5) {
      circle(70, 475, 35);
      clock.addTime(-1, 0);
    }
    if (mouseX > 312.5 && mouseX < 347.5 && mouseY > 457.5 && mouseY < 492.5) {
      circle(330, 475, 35);
      clock.addTime(1, 0);
    }
    if (mouseX > 352.5 && mouseX < 387.5 && mouseY > 457.5 && mouseY < 492.5) {
      circle(370, 475, 35);
      clock.addTime(10, 0);
    }
    
    //restart function
    if (mouseY > 560) {
      println("Restarting");
        parent.removePlayer();
        parent.removePlayer();
        parent.removePlayer();
        clock.changeTime(30,0);
        Score player = players.get(0);
        player.resetPoints();
    }
    
    //change background buttons
    if (mouseX > 85 && mouseX < 115 && mouseY > 18 && mouseY < 48) {
      parent.background = 0;
    }
    if (mouseX > 125 && mouseX < 155 && mouseY > 18 && mouseY < 48) {
      parent.background = 1;
    }
    if (mouseX > 165 && mouseX < 195 && mouseY > 18 && mouseY < 48) {
      parent.background = 2;
    }
    if (mouseX > 205 && mouseX < 235 && mouseY > 18 && mouseY < 48) {
      parent.background = 3;
    }
    if (mouseX > 245 && mouseX < 275 && mouseY > 18 && mouseY < 48) {
      parent.background = 4;
    }
    if (mouseX > 285 && mouseX < 315 && mouseY > 18 && mouseY < 48) {
      parent.background = 5;
    }
  }
  
  //change time with slider
  void mouseDragged() {
    if ((mouseY > 455 && mouseY < 485) && (mouseX > 100 && mouseX < 300)) {
      sliderTime = mouseX;
      clock.stopTimer();
      clock.changeTime(int(map(sliderTime, 98, 297, 0, 60)), 01);
      clock.startTimer();
    }
  }
  
  //fans jump on key press
  void keyPressed() {
    parent.keyPressed();
  }
}
