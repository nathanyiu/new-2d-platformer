void intro() {
  background(red);
  textAlign(CENTER);
  fill(white);
  text("Mario Game",400,400);
  marioJump.resize(100,100);
  image(marioJump,350,450);
  if (fontColor/20 == 0) {
    fill(red);
  } else if (fontColor/20 == 1) {
    fill(blue); 
  } else {
    fontColor = 0; 
  }
  fontColor++;
  text("Start",400,650);
  if (mousePress(220,578,360,72,1)){
    mode = game; 
  }
}
