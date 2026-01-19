boolean mousePress(int x, int y, int w, int l, int t) {
  if (mousePressed) {
    //circles
    if (t == 0) {
      if (dist(mouseX, mouseY, x, y) < l) {
        return true;
      } else {
        return false;
      }
    } //squares
    else if (t == 1) {
      if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+l) {
        return true;
      } else {
        return false; 
      }
    }
  }
  return false;
}
