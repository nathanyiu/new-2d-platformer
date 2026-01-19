import fisica.*;
PFont marioFont;
PImage map;
PImage brick, lava, ladder, ice, spike;
PImage trampDown, trampMid, trampUp;
PImage bridgeWest, bridgeMiddle, bridgeEast;
PImage treeEast, treeNormal, treeWest, tree_Trunk, treeIntersect;
PImage goomba0, goomba1, marioJump;
PImage pauseImage;
PImage heart;
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
boolean wKey, aKey, sKey, dKey, iKey, jKey, kKey, lKey;
ArrayList <trampoline> tramps;
ArrayList <lava> lavas;
ArrayList <bridge> bridges;
ArrayList <hitBox> hitBoxes;
ArrayList <goomba> goombas;
goomba goomba;
hitBox playBottom, sideHB;
FWorld world;
FBox spikes;
trampoline tramp;
lava lav;
bridge br;
FPlayer player1;
void settings() {
  size(800, 800, P2D);
  pixelDensity(1);
}
void setup() {
  marioFont = createFont("super_mario_256/SuperMario256.ttf", 72);
  textFont(marioFont);
  Fisica.init(this);
  world = new FWorld(-100, 0, 25000, 25000);
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
  hearts();
}



void makePlayer() {
  player1 = new FPlayer();
  playBottom = new hitBox(player1.getX(), player1.getY()+12.5);
  world.add(player1);
  world.add(playBottom);
  hitBoxes.add(playBottom);
}

void draw() {
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
  background(255);
  drawWorld();
  player1.act();
  for (int i = 0; i < goombas.size(); i++) {
    goombas.get(i).act();
  }
  for ( int i = 0; i < hitBoxes.size(); i++) {
    hitBoxes.get(i).act();
  }
  for (int i = 0; i < tramps.size(); i++) {
    tramps.get(i).act();
  }
  for (int i = 0; i < lavas.size(); i++) {
    lavas.get(i).act();
  }
  for (int i = 0; i < bridges.size(); i++) {
    bridges.get(i).act();
  }
}
void drawWorld() {
  pushMatrix();
  if (width == 800 && height == 800) {
    if (player1.getX() >= gridSize*13) {
      translate(-player1.getX()*zoom+width/2, -player1.getY()*zoom+height/2);
    } else {
      translate(gridSize/2-70, -player1.getY()*zoom+height/2);
    }
      scale(zoom);
  } else {
    
  }

  world.step();
  world.draw();
  popMatrix();
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
