final color UNHOVERBG = color(150);
final color HOVERBG = color(30, 199, 41);

Button restart = new Button(100, 350, 100, 60, "RESTART");
;
Button exit = new Button(400, 350, 100, 60, "EXIT");
;
Button score = new Button(250, 350, 100, 60, "SCORES");
;

int bagImgY = height;

void GameOver() {

  if (globalDamageDone >= globalDamage && height / 3 < bagImgY) {
    bagImgY--;
  }
  fill(0);
  image(underwaterBg, 0, 0);
  image(bagStacked, 0, bagImgY);

  fill(255);
  textSize(32);
  text("GAME OVER", (width / 2) - (textWidth("GAME OVER") / 2), 80);
  String msg =  "LEVEL: "+user.getLevel();
  text(msg, (width / 2) - (textWidth(msg) / 2), 130);
  msg = "SCORE: "+user.getPoints();
  text(msg, (width / 2) - (textWidth(msg) / 2), 166);

  restart.render();
  exit.render();
  score.render();
}

void mousePressed() {
  if (currentState == GameState.START_UP) { // startup screen
    if (start.hover) {
      if (name == "") {
        currentError = StartUpError.INVALID_NAME;
      } else {
        currentState = GameState.RESTART;
      }
    }
  } else if (currentState == GameState.GAME_OVER || currentState == GameState.SHOW_SCORE) { // gameover OR score screen
    if (restart.hover) {
      currentState = GameState.RESTART;
    } else if (score.hover) {
      currentState = GameState.SHOW_SCORE;
    } 
    if (exit.hover) {
      print("You have exited the program");
      exit();
    }
  }
}
