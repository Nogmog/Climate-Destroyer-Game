abstract class Enemy {
  PImage images[];

  private int x;
  private int y;
  private int dy;
  private Boolean smartEnemy = false;
  private int damage = 1;
  private int scoreAward = 1;
  private PImage currentImage = null; // override for the image gif = false in implementation

  //IMAGE ANIMATION
  private Boolean gif = false;
  private int imageIteration = 0;
  private int iterationLimit = 0;
  private String fileName = null;
  private String fileType = ".png";
  private int buffer = 0;



  Enemy(int x, int y, int dy, Boolean smartEnemy) {
    this.x = x;
    this.y = y;
    this.dy = dy;
    this.smartEnemy = smartEnemy;
  }

  void render() { // draw character

    if (gif) {
      currentImage = updateImage();
    }
    moveEnemy();

    image(currentImage, x, y);
  }


  void moveEnemy() {
    if (buffer % 2 == 0) {
      this.y -= dy;

      if (this.smartEnemy) {
        moveSmartly();
      }
    }
  }
  Boolean isOffScreen() {
    return (this.y + 64 < 0);
  }
  PImage updateImage() {
    if (buffer > 10) {
      updateIteration(imageIteration);
      buffer = 0;
    } else {
      buffer++;
    }

    return images[imageIteration];
  }
  void moveSmartly() {
    if (user.moving) {
      switch(user.directionLooking) {
      case "LEFT":
        if (this.x > 0) {
          this.x -= 3;
        }
        break;
      case "RIGHT":
        if (this.x < width - 64) {
          this.x += 3;
        }
        break;
      }
    } else {
      int difference = this.x - user.x;
      if (difference <= 50 && difference >= -50) {
      } else {
        if (difference < 0) {
          this.x += 3;
        } else if (difference > 0) {
          this.x -= 3;
        }
      }
    }
  }

  void updateIteration(int iteration) {
    if (iteration >= iterationLimit) {
      this.imageIteration = 0;
    } else {
      this.imageIteration++;
    }
  }

  private void setupObject() {

    images = new PImage[iterationLimit + 1]; // list to store images
    //LOADS ALL IMAGES AND PLACES THEM INTO IMAGES ARRAY (super)

    for (int i=0; i<images.length; i++) {
      PImage image = loadImage(fileName + i + fileType);
      image.resize(64, 64);
      images[i] = image;
    }
  }
}
