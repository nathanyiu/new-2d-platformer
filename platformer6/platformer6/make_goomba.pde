void makeGoomba(int x,int y) {

  boolean wall = false;
  int i = 1;
  float leftWall = 0;
  float rightWall = 0;
  while (wall == false) {
    if (map.get(x-i, y) != walls) {
      i++;
    } else {
      leftWall = (x-i)*gridSize;
      wall = true;
      i = 1;
    }
  }
  wall = false;
  while (wall == false) {
    if (map.get(x+i, y) != walls) {
      i++;
    } else {
      rightWall = (x+i)*gridSize;
      wall = true;
      i = 1;
    }
  }
  goomba = new goomba(x*gridSize, y*gridSize, leftWall, rightWall);
  goomba.setName("goomba");
  world.add(goomba);
  goombas.add(goomba);
}
