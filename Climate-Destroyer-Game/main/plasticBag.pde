class PlasticBag {

  int x;
  int y;
  int dy;

  PImage img;

  PlasticBag(int x, int y, int dy) {
    this.x = x;
    this.y = y;
    this.dy = dy;

    img = loadImage("bag-icon.png");
    img.resize(32, 32);
  }

  void render() {
    updatePosition();
    image(img, x, y);
  }


  void updatePosition() {
    this.y += dy;
  }

  Boolean findCollision(Enemy item) {
    //print(this.x, this.y, item.x, item.y);
    if (this.x + 32 >= item.x && this.x <= item.x + 64) {
      if (this.y + 32 >= item.y && this.y <= item.y + 64) {
        return true;
      }
    }
    return false;
  }

  Boolean isOffScreen() {
    return (this.y > height - 61);
  }
}
