import java.util.*;

// Create new variables
PImage background, bagStacked, underwaterBg;
Blob test;
Gastropod test1;
Player user;

enum GameState {
  START_UP, 
    PLAYING, 
    RESTART, 
    GAME_OVER, 
    SHOW_SCORE
}

enum StartUpError {
  NONE, 
    INVALID_NAME, 
    INVALID_CHARACTER, 
    TOO_LONG
}

StartUpError currentError = StartUpError.NONE;
GameState currentState = GameState.START_UP;

ArrayList<Blob> storedBlobs = new ArrayList<Blob>();
ArrayList<Gastropod> storedGastropods = new ArrayList<Gastropod>();
ArrayList<PlasticBag> storedBags = new ArrayList<PlasticBag>();

public void settings() {
  size(600, 500);
}

void setup() {
  background = loadImage("underwaterBg.png");
  background.resize(width, height);
  user = new Player(100, 20, 5);

  // IMAGES FOR GAME_OVER
  bagStacked = loadImage("BagsStacked.jpg");
  underwaterBg = loadImage("Underwater_GameOver.jpg");
  underwaterBg.resize(width, height);
  bagStacked.resize(width, height);
}


void draw() {
  switch(currentState) {
  case START_UP:
    StartUp();
    break;
  case PLAYING:
    PlayingGame();
    break;
  case GAME_OVER:
    GameOver();
    break;
  case SHOW_SCORE:
    HighScores();
    break;
  case RESTART:
    RestartGame();
    currentState = GameState.PLAYING;
  }
}
