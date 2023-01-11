public class Player {
  private int x;
  private int y = 20;
  private int dx;
  private int points = 0;
  private int lives = 3;
  private int level = 1;

  private PImage[] leftImages;
  private PImage[] rightImages;
  String directionLooking = "RIGHT";

  // for animating
  private int buffer = 0;
  private int currentImage = 0;
  Boolean moving = false;

  Player(int x, int y, int dx) {
    this.x = x;
    this.y = y;
    this.dx = dx;  

    setupObject();
  }

  void render() {

    if (moving) {
      movePlayer();
      animate();
    } else {
      currentImage = 0;
      buffer = 0;
    }

    if (directionLooking == "LEFT") {
      image(leftImages[currentImage], x, y);
    } else if (directionLooking == "RIGHT") {
      image(rightImages[currentImage], x, y);
    }
    
  }

  void animate() {
    buffer++;
    if (buffer % 5 == 0) {
      if (currentImage >= 8) {
        currentImage = 0;
      } else {
        currentImage++;
      }
    }
  }
  void awardPoints(int pts) {
    points += pts;
  }
  void movePlayer() {
    switch(directionLooking) {
    case "LEFT":
      if (this.x >= 0) {
        this.x -= dx;
      } else {
        this.moving = false;
      }

      break;
    case "RIGHT":    
      if (this.x <= width - 117) {
        this.x += dx;
      } else {
        this.moving = false;
      }
      break;
    }
  }

  Boolean enemyCollide(Enemy item) {
    if (this.x + 117 >= item.x && this.x <= item.x + 64) {
      if (this.y + 37 >= item.y && this.y <= item.y + 64) {
        return true;
      }
    }
    return false;
  }

  void setupObject() {

    leftImages = new PImage[9];
    rightImages = new PImage[9];

    //LOADS ALL IMAGES AND PLACES THEM INTO IMAGES ARRAY

    for (int i=0; i<leftImages.length; i++) {

      PImage loadedRightImage = loadImage("kayakRight" + i + ".png");
      loadedRightImage.resize(117, 37);
      rightImages[i] = loadedRightImage;

      PImage loadedLeftImage = loadImage("kayakLeft" + i + ".gif");
      loadedLeftImage.resize(117, 37);
      leftImages[i] = loadedLeftImage;
    }
  }
  void addLevel(int change) {
    this.level += change;
  }

  int getLevel() {
    return this.level;
  }

  int getPoints() {
    return this.points;
  }
}
