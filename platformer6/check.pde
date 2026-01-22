class checkPoint extends FBox {
  float ogx,ogy;
  boolean touched;
  checkPoint(int x,int y) {
    super(gridSize,gridSize);
    setFillColor(red);
    setStatic(true);
    setSensor(false);
    setPosition(x,y);
    ogx = x;
    ogy = y-35;
    touched = false;
  }
  void act() {
    if (isTouchingBody(player1) && touched == false) {
      setFillColor(green);
      CPX = ogx;
      CPY = ogy;
      touched = true;
    }
  }
}
