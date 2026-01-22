class goomba extends FBox {
  int i, d, vel;
  float leftW, rightW;

  goomba(float x, float y, float leftWall, float rightWall) {
    super(25, 25);
    leftW = leftWall;
    rightW = rightWall;
    setPosition(x, y);
    setRotatable(false);
    setGrabbable(false);
    setSensor(false);
    setVelocity(-100, 0);
    i = 0;
    d = -1;
    vel = 100;
  }
  void act() {
    if (isTouchingBody(playBottom)) {
      world.remove(this);
    }
    if (i/20< 2) {
      if (i/20 == 0) {
        attachImage(goomba0);
      } else {
        attachImage(goomba1);
      }
    } else {
      i = 0;
    }
    i++;
    if (getX() <= leftW) {
      setPosition(leftW + 3, getY());
      vel *= d;
      setVelocity(vel, getVelocityY());
    } else if (getX() >= rightW) {
      setPosition(rightW - 3, getY());
      vel *= d;
      setVelocity(vel, getVelocityY());
    } else {
      setVelocity(vel, getVelocityY());
    }
  }
}
