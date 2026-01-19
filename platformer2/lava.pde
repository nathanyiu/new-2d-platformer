class lava extends FBox {
  int i;
  lava(int x, int y) {
    super(gridSize, gridSize/5);
    setPosition(x, y);
    attachImage(lava);
    setStatic(true);
    setGrabbable(false);
    i = int(random(0, 50));
  }
  void act() {
    if (int(i/10) > 5) {
      i = 0;
    }
    PImage l = loadImage("mario_terrain/lava"+int(i/10)+".png");
    l.resize(gridSize, gridSize);
    attachImage(l);
    i++;
  }
}
