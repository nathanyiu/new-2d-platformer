import fisica.*;
PFont marioFont;
PImage map;
PImage brick, lava, ladder, ice, spike;
PImage trampDown, trampMid, trampUp;
PImage bridgeWest, bridgeMiddle, bridgeEast;
PImage treeEast, treeNormal, treeWest, tree_Trunk, treeIntersect;
PImage goomba0, goomba1, marioJump;
PImage pauseImage;
PImage heart, heart2, darkness;
int hp = 3;
int gridSize = 35;
int goombaCount;
int mode, intro, game, lose, win, pause;
int fontColor;
float zoom = 1;
float CPX, CPY;
color black, white, grey, red, green, blue, orange, yellow, trampGreen, spikeGrey, gmba;
color treeE, tree, treeMid, treeW, treeTrunk, treeInter;
color bridgeE, bridgeMid, bridgeW;
color hrt;
color border, walls;
color checkP;
boolean wKey, aKey, sKey, dKey, iKey, jKey, kKey, lKey;
ArrayList <trampoline> tramps;
ArrayList <lava> lavas;
ArrayList <bridge> bridges;
ArrayList <hitBox> hitBoxes;
ArrayList <goomba> goombas;
ArrayList <checkPoint> checkPoints;
goomba goomba;
hitBox playBottom, sideHB;
FWorld world;
FBox spikes;
trampoline tramp;
lava lav;
bridge br;
checkPoint cp;
FPlayer player1;
void settings() {
  size(800, 800, P2D);
  pixelDensity(1);
}
void setup() {
  marioFont = createFont("super_mario_256/SuperMario256.ttf", 72);
  textFont(marioFont);
  Fisica.init(this);
  world = new FWorld(-100, 0, 10000, 10000);
  world.setGravity(0, 900);
  map = loadImage("map 1.png");
  CPX = 70;
  CPY = 700;
  fontColor = 0;
  defineModes();
  createArrayLists();
  png();

  colors();
  worldGenerate();
  makePlayer();
}



void makePlayer() {
  player1 = new FPlayer();
  playBottom = new hitBox(player1.getX(), player1.getY()+12.5);
  world.add(player1);
  world.add(playBottom);
  hitBoxes.add(playBottom);
}

void draw() {
  println(frameRate);
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
    hearts();
  } else if (mode == lose) {
    lose();
  } else if (mode == win) {
    win();
  } else if (mode == pause) {
    pause();
  }
}
void game() {
  if (black()) {
    background(0);
  } else {
    background(255);
  }
  drawWorld();
  player1.act();
  playBottom.act();
  for (int i = 0; i < checkPoints.size(); i++) {
    checkPoint c = (checkPoint) checkPoints.get(i);
    if (dist(player1.getX(),player1.getY(), c.getX(),c.getY()) < 800) {
       c.act();
    }
  }
  for (int i = 0; i < goombas.size(); i++) {
    goomba gm = (goomba) goombas.get(i);
    if (dist(player1.getX(), player1.getY(), gm.getX(), gm.getY()) < 800) {
      gm.act();
    }
  }
  for (int i = 0; i < tramps.size(); i++) {
    trampoline tr = (trampoline) tramps.get(i);
    if (dist(player1.getX(), player1.getY(), tr.getX(), tr.getY()) < 800) {
      tr.act();
    }
  }
  for (int i = 0; i < lavas.size(); i++) {
    lava la = (lava) lavas.get(i);
    if (dist(player1.getX(), player1.getY(), la.getX(), la.getY()) < 800) {
      la.act();
    }
  }
  for (int i = 0; i < bridges.size(); i++) {
    bridge br = (bridge) bridges.get(i);
    if (dist(player1.getX(), player1.getY(), br.getX(), br.getY()) < 800) {
      br.act();
    }
  }
}
void drawWorld() {
  pushMatrix();
  if (player1.getX() >= gridSize*13) {
    translate(-player1.getX()*zoom+width/2, -player1.getY()*zoom+height/2);
  } else {
    translate(gridSize/2-70, -player1.getY()*zoom+height/2);
  }
  scale(zoom);
  world.step();
  for (FBody b : (ArrayList<FBody>)world.getBodies()) {
    float d = dist(player1.getX(), player1.getY(), b.getX(), b.getY());
    if (d < 800 && b != player1 && black() == false) {
      b.draw(this);
    } else {
      if (black() && d < 192) {
        b.draw(this);
      }
    }
  }
  player1.draw(this);
  popMatrix();
  if (black()) {
    image(darkness, -400, -400);
  }
}
void keyPressed() {

  if (key == 'a' || key == 'A') {
    aKey = true;
    player1.current = player1.runLeft;
  }
  if (key == 's' || key == 'S') sKey = true;
  if (key == 'd' || key == 'D') {
    dKey = true;
    player1.current = player1.runRight;
  }
  if (key == 'w' || key == 'W') {
    wKey = true;
  }
}

void keyReleased() {

  if (key == 'a' || key == 'A') {
    aKey = false;
    player1.current = player1.idl;
  }
  if (key == 's' || key == 'S') sKey = false;
  if (key == 'd' || key == 'D') {
    dKey = false;
    player1.current = player1.idl;
  }
  if (key == 'w' || key == 'W') {
    player1.current = player1.idl;
    wKey = false;
  }
  if (keyCode == TAB) {
    if (mode == game) {
      pauseImage = get();
      mode = pause;
    } else if (mode == pause) {
      mode = game;
    }
  }
}
boolean black() {
  if (player1.getY() > 1120) {
    return true;
  } else if (player1.getY() > 875 && player1.getX() > 4270) {
    return true;
  }
  return false;
}
