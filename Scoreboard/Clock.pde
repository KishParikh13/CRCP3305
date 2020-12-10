class Clock {

//properties
  int savedTime;
  int secondTime;
  
  int minutes;
  int seconds;
  boolean stopTime = false;

//constructor
  Clock (int min, int sec) {
    minutes = min;
    seconds = sec;

    secondTime = 1000;
  }

//start clock
  void start() {
    savedTime = millis();
  }


//move clock
  boolean isFinished() { 
    
    int passedTime = millis() - savedTime;
        
    if (seconds == 0) {
      seconds = 60;
      minutes--;
    }
    
    if (seconds > 60) {
      seconds = 60;
      minutes++;
    }
    
    if (seconds < 0 || minutes < 0) {
      minutes = 0;
      seconds = 0;
      stopTimer();
    }

    if ((passedTime > secondTime) && (stopTime == false))  {
      seconds--;
      return true;
    } else { 
      return false;
    }
  }
   
//display
  void display() {
    textFont(scoreFont);
    textSize(72);
    textAlign(CENTER);

    int clockY = 330; //clock height
    
    //print clock
    fill(255);
    text(minutes, (width/2 - 60), clockY);
    text(":", width/2, clockY);
    
    if (seconds > 9) {
      text(seconds, (width/2)+62, clockY);
    } else {
      text("0", (width/2)+39, clockY);
      text(seconds, (width/2)+84, clockY);
    }
    clock.start();
  }
//add time
  void addTime(int addMin, int addSec) {
    minutes = minutes + addMin;
    seconds = seconds + addSec;
  }
  
//change time  
  void changeTime(int newMin, int newSec) {
    minutes = newMin;
    seconds = newSec;
  }
//stop time  

  void stopTimer() {
    stopTime = true;
  }
//start time
  void startTimer() {
    stopTime = false;
  }
 
}
