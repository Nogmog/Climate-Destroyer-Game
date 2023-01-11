final color SAND = color(220, 192, 139);
final color RED = color(255, 0, 0);

final int globalDamage = 50; // total damage that can be done to it
public int globalDamageDone = 0; // bags which have fallen to the bottom

void PlayingGame() {
  image(background, 0, 0);
  user.render();

  // BAGS
  for (int i=0; i<storedBags.size(); i++) {
    PlasticBag item = storedBags.get(i);
    if (item.isOffScreen()) {
      storedBags.remove(item);
      globalDamageDone++;

      if (globalDamageDone >= globalDamage) {
        currentState = GameState.GAME_OVER;
      }
    }
    item.render();
  }
  // BLOBS
  for (int i=0; i<storedBlobs.size(); i++) {
    Enemy item = storedBlobs.get(i);
    updateEnemies(item);
  }

  // GASTROPODS
  for (int i=0; i<storedGastropods.size(); i++) {
    Enemy item = storedGastropods.get(i);
    updateEnemies(item);
  }

  checkCurrentLevel();
  showInformation();
}

void showInformation() {
  textSize(16);
  noStroke();

  fill(RED);
  rect(0, height - 25, width, 25); // behind rectangle
  fill(SAND);
  float dmgWidthPercent = (((float)globalDamage - (float)globalDamageDone) / (float)globalDamage); // calculates % of how much bar should be filled
  rect(0, height - 25, dmgWidthPercent * width, 25); // less width causes more of the red to show
  fill(0);
  text("CLIMATE DAMAGE", width / 2 - textWidth("CLIMATE DAMAGE") / 2, height - 8);
  text("POINTS " + user.getPoints(), 10, height - 33);
  text("LEVEL " + user.getLevel(), width / 2 - textWidth("LEVEL " + user.getLevel()) / 2, height - 33);
  text("LIVES LEFT: " + user.lives, width - textWidth("LIVES LEFT: " + user.lives) - 10, height - 33);
  rect(0, height - 27, width, 2); // border for top of menu
}

void updateEnemies(Enemy item) {
  removeTopScreen(item);
  playerCollision(item);
  bagCollision(item);
  item.render();
}

void removeTopScreen(Enemy enemy) {
  if (enemy.isOffScreen()) {
    removeOnType(enemy);
    addNewEnemyRandom();
  }
}

void removeOnType(Enemy item) {
  switch(item.fileName) {
  case "snail":
    storedGastropods.remove(item);
    break;
  case "blob":
    storedBlobs.remove(item);
    break;
  }
}

void playerCollision(Enemy enemy) {
  if (user.enemyCollide(enemy)) {
    switch(user.lives) {
    case 1:
    case 2: 
    case 3:
      user.lives--;
      removeOnType(enemy);
      addNewEnemyRandom();
      break;
    case 0:
      currentState = GameState.GAME_OVER;
      break;
    }
  }
}

void bagCollision(Enemy enemy) {
  for (int i=0; i<storedBags.size(); i++) {

    PlasticBag bag = storedBags.get(i);
    Boolean result = bag.findCollision(enemy);

    //println(result);
    if (result) {
      storedBags.remove(bag);
      removeOnType(enemy);

      user.awardPoints(enemy.scoreAward);
      addNewEnemyRandom();
      break; // breaks loop
    }
  }
}

void checkCurrentLevel() {
  int newLevel = 1 + user.getPoints() / 25;
  if (user.getLevel() != newLevel) {
    user.addLevel(newLevel - user.getLevel());
    if (newLevel % 4 == 0) { // every 4 levels, make add 1 more enemy
      addNewEnemyRandom();
    }
  }
}

void addNewEnemyRandom() {
  int plrLevel = user.getLevel();
  Boolean isSmart = ((int)random(0, 6) == 5);
  int random = (int)random(1, 4 + plrLevel);

  if (random >= 6) { // new enemy type at level 2
    Blob blob = new Blob((int)random(0, width-64), (int)random(height + 33, height + 73), 4 + floor(plrLevel / 2), isSmart);
    storedBlobs.add(blob);
  } else { 
    Gastropod pod = new Gastropod((int)random(0, width-64), (int)random(height + 33, height + 73), 2 + floor(plrLevel / 2), isSmart);
    storedGastropods.add(pod);
  }
}
