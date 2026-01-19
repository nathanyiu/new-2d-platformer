void lose() {
  background(black);
  textAlign(CENTER);
  fill(red);
  text("game over", 400, 350);
  //fill(blue);
  //rect(150,540,500,144);
  //fill(red);
  text("play again?", 400, 600);
  if (mousePress(150, 540, 500, 144, 1)) {
    reset();
    mode = game;
  }
}
