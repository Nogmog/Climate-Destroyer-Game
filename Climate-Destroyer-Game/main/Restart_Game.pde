void RestartGame() {
  storedGastropods.clear();
  storedBlobs.clear();
  storedBags.clear();
  
  user.x = (int)random(10, width-127);
  user.points = 0;
  user.lives = 3;
  user.level = 1;
  
  globalDamageDone = 0;
  bagImgY = height;
  used = false;
  
  addNewEnemyRandom();
  addNewEnemyRandom();
  addNewEnemyRandom();
  addNewEnemyRandom();
  addNewEnemyRandom();
}
