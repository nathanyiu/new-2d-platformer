void hearts() {
  if (hp > 4) {
    hp = 4; 
  }
  for (int i = 0; i < hp; i++) {
    heart.resize(50, 50);
    image(heart, i*80+30, 700);
  }
}
