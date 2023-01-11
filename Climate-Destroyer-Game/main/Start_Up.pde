String tempName = "", name = "";
Button start = new Button((300) - 75, 350, 150, 60, "PLAY");


void StartUp() {
  fill(0);
  rect(-2, -2, width + 2, height + 2);

  textSize(32);
  fill(255);

  text("CLIMATE DESTROYER SIMULATOR", (width / 2) - (textWidth("CLIMATE DESTROYER SIMULATOR") / 2), 75);

  start.render();

  textBox(125);
}

void textBox(int y) {
  int x = width / 2 - 100; // centralised
  textSize(16);

  fill(100);
  rect(x, y, 200, 50);

  fill(255); // TEXT
  text("Enter name:", x - textWidth("Enter name:") - 10, y + 32); // top bit
  text(tempName, x + 5, y + 32);

  text("Confirmed name:", x - textWidth("Confirmed name:") - 10, y + 82); // bottom bit
  text(name, x + 5, y + 82);
  
  // error detector
  switch(currentError) {
  case INVALID_NAME:
    showError("Type and press enter to confirm name");
    break;
  case INVALID_CHARACTER:
    showError("Invalid character used");
    break;
  case TOO_LONG:
    showError("Name is too long");
    break;
  default: // exists to stop errors
    break;
  }
}

void showError(String message) {
  textSize(32);
  fill(255, 22, 12);
  text(message, width / 2 - textWidth(message) / 2, 445);
}
