class Score {
  
//properties
    String name;
    int points;
    float scoreX;
    float scoreY;
    int pointIncrement;
    float size;
    String newName;
  
  //constructors
    Score (String nameIn) {
      name = nameIn;
      points = 00;
      pointIncrement = 1;
      newName="";
    }
  
  //methods
    void display (float scoreXIn, float scoreYIn) {;
      scoreX = scoreXIn;
      scoreY = scoreYIn+70;
      textAlign(CENTER);
      
      fill(255);
      textFont(nameFont);
      textSize(40-(2*players.size()));
      text(name, scoreX, scoreY+40);
      textFont(scoreFont);
      textSize(40);
      text(points, scoreX, scoreY + 100);
    }
 
    //change points
    void changePoints(int amount) {
      points = points + amount;
    }
    
    //reset points to 0
    void resetPoints() {
      points = 0;
    } 
    
    //void changePointIncrement (int newPointIncrement) {
    //  pointIncrement = newPointIncrement;
    //}
}
