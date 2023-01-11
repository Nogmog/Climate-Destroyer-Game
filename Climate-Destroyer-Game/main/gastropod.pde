class Gastropod extends Enemy {

  Gastropod(int x, int y, int dy, Boolean smartEnemy) {
    super(x, y, dy, smartEnemy);

    //@Override
    super.damage = 4;
    super.gif = true;
    super.iterationLimit = 5;
    super.fileName = "snail";

    super.setupObject();
  }
}
