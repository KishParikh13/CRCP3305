int numPlayers = 1;

//arraylist of players
ArrayList<Score> players = new ArrayList<Score>();

//backgrounds and icons
PImage footballBack;
  PImage footballIcon;
PImage basketballBack;
  PImage basketballIcon;
PImage soccerBack;
  PImage soccerIcon;
  
//fonts
PFont scoreFont;
PFont nameFont;
PFont controllerFont;

//clock object
Clock clock;

//fans
int numFans = 11;
Fan[] fans = new Fan[numFans];

int background = 0;

void settings() {
  size(800, 800);
}

void setup() {
  footballBack = loadImage("scoreboard.png");
    footballIcon = loadImage("football.png");
  basketballBack = loadImage("basketballBack.png");
    basketballIcon = loadImage("basketball.png");
  soccerBack = loadImage("soccerField.png");
    soccerIcon = loadImage("soccerball.png");  
    
  scoreFont = createFont("CursedTimerUlil-Aznm.ttf", 3);
  nameFont = createFont("VarsityTeamBold-6AXq.otf", 3);
  controllerFont = loadFont("BelloCapsPro-Regular-48.vlw");
    
  clock = new Clock(30, 01);
  clock.start();
  
  addPlayer(); //start with one player
  
  openController(); //open controller object
  
  for (int i = 0; i < numFans; i++) {
    fans[i] = new Fan((i)*(width/(numFans))-160, i%4); //initialize fans
  }
}

void draw () {
     
  //set background
  if (clock.isFinished()) {
    switch(background) {
      case 0:
        image(footballBack, 0, 0, width, height);
        break;
      case 1:
        image(basketballBack, 0, 0, width, height);
        break;
      case 2:
        image(soccerBack, 0, 0, width, height);
        break;
      case 3:
        background(#EA9007);
        break;
      case 4:
        background(#FF7979);
        break;
      case 5:
        background(0);
        break;
    }
    
    //display clock
    clock.display();
    
    //display fans and jump when told to
    for (int i = 0; i < numFans; i++) {
      fans[i].display();
        if (fans[i].jump) {
          fans[i].jump();
        }
    }
  }
  
  //display player scores
  for (int i = 0; i < players.size(); i++) {
    Score player = players.get(i);
    player.display((i+1)*(width/(players.size()+1)), 50);
  }
}

//return points of player
int getPoints(int whichPlayer) {
  whichPlayer--;
  Score player = players.get(whichPlayer);
  return player.points;
}

//open controller
void openController() {
    Controller controller = new Controller(this);
    String[] args = {"Hi."};
    PApplet.runSketch(args, controller);
    println("Controller has been opened");
}

//add player
void addPlayer() {
  if (players.size() < 4) {
    players.add(new Score("Player " + (players.size()+1)));
  }
}

//remove player
void removePlayer() {
  if (players.size() > 1) {
    players.remove(players.size()-1);
  }
}

//fans jump when key pressed
void keyPressed() {
  for (int i = 0; i < numFans; i++) {
    fans[i].jump = true;
  }
}
