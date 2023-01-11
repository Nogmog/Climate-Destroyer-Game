void keyPressed() { // ISSUE: still gifs when holding
  if (currentState == GameState.START_UP) { // startup screen
    if (keyCode == ENTER) {
      name = tempName;
      tempName = "";
    } else {
      if (textWidth(tempName) >= 195) {
        // SHOW ERROR
        currentError = StartUpError.TOO_LONG;
      } else {
        if (keyCode == ' ' || key == BACKSPACE || key == SHIFT) {
          currentError = StartUpError.INVALID_CHARACTER;
        } else {
          tempName += key;
        }
      }
    }
  }
  // gameplay screen
  if (currentState == GameState.PLAYING) {
    switch(keyCode) {
    case RIGHT:
      user.moving = true;
      user.directionLooking = "RIGHT";
      break;
    case LEFT:
      user.moving = true;
      user.directionLooking = "LEFT";
      break;
    case ' ':
      PlasticBag bag = new PlasticBag(user.x + 42, user.y + 32, 3);
      storedBags.add(bag);
      break;
    }
  }
}

void keyReleased() { // ISSUE: holding both buttons -> release one -> doesnt move anymore as its now false.
  if (keyCode == RIGHT) {
    user.moving = false;
  } else if (keyCode == LEFT) {
    user.moving = false;
  }
}
