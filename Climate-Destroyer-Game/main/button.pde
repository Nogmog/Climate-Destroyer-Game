class Button {
  private int x;
  private int y;
  private int sizeX;
  private int sizeY;
  private String msg;
  Boolean hover = false;

  Button(int x, int y, int sizeX, int sizeY, String msg) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.msg = msg;
  }

  void render() {
    detectHover();
    drawBox();
  }

  private void drawBox() {
    // changes colour based on mouse position
    if (hover) {
      fill(HOVERBG);
    } else {
      fill(UNHOVERBG);
    }
    rect(x, y, sizeX, sizeY);
    fill(0);
    textSize(16);
    text(msg, x + (sizeX / 2) - (textWidth(msg) / 2), y + (sizeY / 2) + 8);
  }

  private void detectHover() {
    if (mouseX >= x && mouseX <= x+sizeX) {
      if (mouseY >= y && mouseY <= y+sizeY) {
        hover = true;
      } else {
        hover = false;
      }
    } else {
      hover = false;
    }
  }
}
