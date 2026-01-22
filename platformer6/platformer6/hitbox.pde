class hitBox extends FBox{
  
  hitBox(float x, float y) {
    super(20,2);
    setFillColor(blue);
    setPosition(x,y);
    setSensor(false);
    setRotatable(false);
  }
  
  void act() {
    setPosition(player1.getX(),player1.getY()+15); 
  }
    boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }
}
  
  
