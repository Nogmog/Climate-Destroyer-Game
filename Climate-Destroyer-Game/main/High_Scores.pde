Table leaderboard;
Boolean used = false;

void HighScores() {
  if (!used) {
    loadData();
    used = true;
    leaderboard = loadTable("leaderboard.csv", "header");
  }
  image(underwaterBg, 0, 0);

  textSize(32);
  fill(255);

  text("HIGH SCORES", (width / 2) - (textWidth("HIGH SCORES") / 2), 50);
  int limit = 10;
  if (leaderboard.getRowCount() < 10) {
    limit = leaderboard.getRowCount();
  }
  for (int i=0; i<limit; i++) {
    textSize(24);
    TableRow currentRow = leaderboard.getRow(i);
    String msg = (i + 1)+ "| " + currentRow.getString("name") + " SCORE: " + currentRow.getInt("score") + " LEVEL: " + currentRow.getInt("level");
    text(msg, 20, 82 + (24 * i));
  }

  //buttons
  restart.render();
  exit.render();
}

void loadData() {
  try { // checks if file exists
    File f = dataFile("leaderboard.csv");
    if (!f.exists()) {
      throw new Exception("FileDoesntExist");
    }
  } 
  catch(Exception e) {
    println("ERROR: FILE NOT FOUND");
    println("Creating new file...");
    PrintWriter newFile = createWriter("data/leaderboard.csv");
    newFile.println("name,score,level");
    newFile.flush();
    newFile.close();
  }
  finally {

    leaderboard = loadTable("leaderboard.csv", "header"); // use functions and that
    addNewScore();
    updateLeaderboard();
  }
}

void addNewScore() {
  TableRow newScore = leaderboard.addRow();
  newScore.setString("name", name);
  newScore.setInt("score", user.getPoints());
  newScore.setInt("level", user.getLevel());
}

void updateLeaderboard() {
  leaderboard.setColumnType("score", Table.INT); // needed for sorting
  leaderboard.sortReverse("score");

  saveTable(leaderboard, "data/leaderboard.csv");
}
