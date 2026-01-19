void reset() {
  player1.setPosition(70,700);
  hp = 3;
  goombas.clear();
  tramps.clear();
  lavas.clear();
  hitBoxes.clear();
  bridges.clear();
  world.remove(goomba);
  world.remove(playBottom);
  world.remove(player1);
  world.setGravity(0,900);
  worldGenerate();
  makePlayer();
}
