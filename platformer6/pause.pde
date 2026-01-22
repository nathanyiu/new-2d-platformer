void pause() {
  image(pauseImage, 0, 0);
  fill(255, 0, 0, 120);
  rect(0, 0, 800, 800);
  textAlign(CENTER);
  fill(white);
  text("PAUSED", 400, 400);
  textFont(marioFont, 50);
  text("Press TAB to unpause", 400, 600);
  textFont(marioFont, 72);
}
