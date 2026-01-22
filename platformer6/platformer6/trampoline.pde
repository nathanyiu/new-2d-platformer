class trampoline extends FBox {
  boolean animate;
  int i;
  float vy;
  trampoline(int x, int y) {
    super(gridSize, gridSize);
    setPosition(x, y);
    setStatic(true);
    setGrabbable(false);
    attachImage(trampDown);
    animate = false;
    i = 0;
    vy = -500;
  }
  void act() {
    if (dist(player1.getX(), player1.getY(), getX(), getY()) > 1000) {
      return;
    }
    if (this.isTouchingBody(player1)) {
      animate = true;
      player1.setVelocity(player1.getVelocityX(), vy);
    }
    if (animate == true ) {
      if (int(i/4) <= 0) {
        attachImage(trampDown);
      } else if (int(i/4) <= 1) {
        attachImage(trampMid);
      } else if ( int(i/4) <= 2) {
        attachImage(trampUp);
      } else if (int(i/4) >= 3) {
        animate = false;
        i=0;
        attachImage(trampDown);
      }
      i++;
    }
  }
}
