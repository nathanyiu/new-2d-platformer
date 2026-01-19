

class bridge extends FBox {
  int countdown;
  boolean touched, ascend;
  float ogY,ogX;
  bridge(int x, int y, int i) {
    super(gridSize, gridSize);
    if (i == 0) {
      attachImage(bridgeWest);
    } else if (i == 1) {
      attachImage(bridgeMiddle);
    } else {
      attachImage(bridgeEast);
    }
    countdown = 30;
    setRestitution(0);
    setStatic(true);
    setGrabbable(false);
    setPosition(x, y);
    touched = false;
    setRotatable(false);
    ogY = y;
    ogX = x;
  }
  void act() {
    setPosition(ogX,getY());
    if (this.isTouchingBody(player1)&& !ascend) {
      touched = true;
      
    }
    if (touched && countdown > 0) {
      countdown--;
    }
    if (countdown <= 0) {
      setStatic(false);
      touched = false;
      
    }
    if (getVelocityY() == 0 && getY() > ogY) {
      ascend = true;
      setSensor(true);
    }
    if (ascend) {
      if (countdown < 60) {
        setSensor(true);
        countdown++;
        setStatic(true);
        setVelocity(0, 0);
      }
      else if (getY() > ogY) {
        setSensor(true);
        setStatic(false);
        setVelocity(0, -200);
      } else {
        setPosition(getX(), ogY);
        setSensor(false);
        setVelocity(0, 0);
        setStatic(true);
        ascend = false;
      }
    }
  }
}
