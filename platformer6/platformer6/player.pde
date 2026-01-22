class FPlayer extends FBox {
  int current, runLeft, runRight, idl, jum;
  int timer, prev;
  PImage[] runL;
  PImage[] runR;
  PImage[] idle;
  PImage[] jump;
  FPlayer() {
    super(25, 25);
    setPosition(70, 700);
    setGrabbable(false);
    setRotatable(false);
    runLeft = 0;
    runRight = 1;
    idl = 2;
    jum = 3;
    current = idl;
    timer = 0;
    prev = runRight;
    runL = new PImage[3];
    runR = new PImage[3];
    idle = new PImage[4];
    jump = new PImage[2];
    loadImages();
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
  void act() {
    move();
    animation();
    collision();
  }
  void collision() {
    for (FBody h : (ArrayList<FBody>) world.getBodies()) {
      if (h.getName() != null && h.getName().equals("heart")) {
        if (h.isTouchingBody(player1)) {
          world.remove(h);
          hp++;
        }
      }
    }
    if (isTouching("goomba") && playBottom.isTouching("goomba") == false) {
      hp--;
      if (hp > 0) {
        setPosition(CPX, CPY);
      } else {
        mode = lose;
      }
    }
    if (wKey) {
      if (isTouching("ladders")) {
        setVelocity(getVelocityX(), -125);
      } else if (isTouching("treeTrunk")) {
        setVelocity(getVelocityX(), getVelocityY());
      } else {
        if (getX() >= 35 && getY() > 2*35) {
          if (getVelocityY() == 0) {
            setVelocity(getVelocityX(), -350);
            current = jum;
            timer = 0;
          }
        }
      }
    }
    if (isTouching("lavas") || isTouching("spike") || isTouching("border")) {
      hp--;
      if (hp > 0) {
        setPosition(CPX, CPY);
      } else {
        mode = lose;
      }
    }
  }
  void animation() {
    if (current == idl) {
      if (prev == runRight) {
        if (timer/30 < idle.length-2) {
          attachImage(idle[timer/30]);
          timer++;
        } else {
          timer = 0;
        }
      } else if (prev == runLeft) {
        if (timer/30 + 2 < idle.length) {
          attachImage(idle[timer/30+2]);
          timer++;
        } else {
          timer = 0;
        }
      }
    } else if (current == runLeft) {
      if (timer/10 < runL.length) {
        attachImage(runL[timer/10]);
        timer++;
      } else {
        timer = 0;
      }
    } else if (current == runRight) {
      if (timer/10 < runR.length) {
        attachImage(runR[timer/10]);
        timer++;
      } else {
        timer = 0;
      }
    } else if  (current == jum) {
      if (prev == runLeft) {
        attachImage(jump[1]);
      } else {
        attachImage(jump[0]);
      }
    }
  }
  void move() {
    if (aKey && getX() >= gridSize/2) {
      setVelocity(-200, getVelocityY());
      if (wKey == false) {
        current = runLeft;
        prev = runLeft;
      }
    }
    if (dKey) {
      setVelocity(200, getVelocityY());
      if (wKey == false) {
        prev = runRight;
        current = runRight;
      }
    }
    if (dKey == false && aKey == false) {
      setVelocity(0, getVelocityY());
    }
  }

  void loadImages() {
    runL[0] = loadImage("mario_sprites/imageReverser/runleft0.png");
    runL[1] = loadImage("mario_sprites/imageReverser/runleft1.png");
    runL[2] = loadImage("mario_sprites/imageReverser/runleft2.png");
    runR[0] = loadImage("mario_sprites/imageReverser/runright0.png");
    runR[1] = loadImage("mario_sprites/imageReverser/runright1.png");
    runR[2] = loadImage("mario_sprites/imageReverser/runright2.png");
    idle[0] = loadImage("mario_sprites/imageReverser/idle0.png");
    idle[1] = loadImage("mario_sprites/imageReverser/idle1.png");
    idle[2] = loadImage("mario_sprites/imageReverser/idleL0.png");
    idle[3] = loadImage("mario_sprites/imageReverser/idleL1.png");
    jump[0] = loadImage("mario_sprites/imageReverser/jump0.png");
    jump[1] = loadImage("mario_sprites/imageReverser/jump1.png");
  }
}
