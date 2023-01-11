public class Blob extends Enemy {


  Blob(int x, int y, int dy, Boolean smartEnemy) {
    super(x, y, dy, smartEnemy);

    //@Override
    super.gif = true;
    super.iterationLimit = 3;
    super.fileName = "blob";
    super.scoreAward = 2;

    super.setupObject();
  }
}
