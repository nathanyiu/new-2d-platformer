void worldGenerate() {
  world.clear();
  world = new FWorld(0, 0, 10000, 10000);
  world.setGravity(0,900);
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      if (c == checkP) {
        cp = new checkPoint(x*gridSize,y*gridSize); 
        checkPoints.add(cp);
        world.add(cp);
      }
      if (c == border) {
         FBox borders = new FBox(gridSize,gridSize);
         borders.setName("border");
         borders.setStatic(true);
         borders.setSensor(true);
         borders.setPosition(x*gridSize,y*gridSize);
         world.add(borders);
      }
      if (c == hrt) {
        FBox hearts = new FBox(gridSize,gridSize); 
        hearts.attachImage(heart2);
        hearts.setName("heart");
        hearts.setStatic(true);
        hearts.setGrabbable(false);
        hearts.setSensor(false);
        hearts.setPosition(x*gridSize, y*gridSize);
        world.add(hearts);
      }
      if (c == gmba) {
        makeGoomba(x,y);
      }
      if (c == spikeGrey) {
        spikes = new FBox(gridSize, gridSize);
        spikes.attachImage(spike);
        spikes.setName("spike");
        spikes.setStatic(true);
        spikes.setGrabbable(false);
        spikes.setSensor(true);
        spikes.setPosition(x*gridSize, y*gridSize);
        world.add(spikes);
      }
      if (c == bridgeE) {
        br = new bridge(x*gridSize, y*gridSize, 2);
        br.setName("bridges");
        bridges.add(br);
        world.add(br);
      }
      if (c == bridgeMid) {
        br = new bridge(x*gridSize, y*gridSize, 1);
        br.setName("bridges");
        bridges.add(br);
        world.add(br);
      }
      if (c == bridgeW) {
        br = new bridge(x*gridSize, y*gridSize, 0);
        br.setName("bridges");
        bridges.add(br);
        world.add(br);
      }
      if (c == treeTrunk) {
        FBox treeTrunks = new FBox(gridSize, gridSize);
        treeTrunks.attachImage(tree_Trunk);
        treeTrunks.setFriction(4);
        treeTrunks.setName("treeTrunk");
        treeTrunks.setStatic(true);
        treeTrunks.setGrabbable(false);
        treeTrunks.setSensor(true);
        treeTrunks.setPosition(x*gridSize, y*gridSize);
        world.add(treeTrunks);
      }
      if (c == treeInter) {
        FBox treeInters = new FBox(gridSize, gridSize);
        treeInters.attachImage(treeIntersect);
        treeInters.setFriction(4);
        treeInters.setName("treeInter");
        treeInters.setStatic(true);
        treeInters.setGrabbable(false);
        treeInters.setPosition(x*gridSize, y*gridSize);
        world.add(treeInters);
      }
      if (c == treeMid) {
        FBox treeMids = new FBox(gridSize, gridSize);
        treeMids.setPosition(x*gridSize, y*gridSize+15);
        treeMids.attachImage(treeNormal);
        treeMids.setFriction(4);
        treeMids.setName("treeMid");
        treeMids.setStatic(true);
        treeMids.setGrabbable(false);
        treeMids.setPosition(x*gridSize, y*gridSize);
        world.add(treeMids);
      }
      if (c == treeW) {
        FBox treeWs = new FBox(gridSize, gridSize);
        treeWs.attachImage(treeWest);
        treeWs.setFriction(4);
        treeWs.setName("treeW");
        treeWs.setStatic(true);
        treeWs.setGrabbable(false);
        treeWs.setPosition(x*gridSize, y*gridSize);
        world.add(treeWs);
      }
      if (c == treeE) {
        FBox treeEs = new FBox(gridSize, gridSize);
        treeEs.attachImage(treeEast);
        treeEs.setFriction(4);
        treeEs.setName("treeE");
        treeEs.setStatic(true);
        treeEs.setGrabbable(false);
        treeEs.setPosition(x*gridSize, y*gridSize);
        world.add(treeEs);
      }
      if (c == blue) {
        FBox ices = new FBox(gridSize, gridSize);
        ices.attachImage(ice);
        ices.setFriction(0.1);
        ices.setName("ices");
        ices.setStatic(true);
        ices.setGrabbable(false);
        ices.setPosition(x*gridSize, y*gridSize);
        world.add(ices);
      } else if (c == trampGreen) {
        tramp = new trampoline(x*gridSize, y*gridSize);
        tramp.setName("tramps");
        tramps.add(tramp);
        world.add(tramp);
      } else if (c == grey) {
        FBox bricks = new FBox(gridSize, gridSize);
        bricks.setName("bricks");
        bricks.attachImage(brick);
        bricks.setFriction(4);
        bricks.setStatic(true);
        bricks.setGrabbable(false);
        bricks.setPosition(x*gridSize, y*gridSize);
        world.add(bricks);
      } else if (c == orange) {
        lav = new lava(x*gridSize, y*gridSize);
        lav.setName("lavas");
        lavas.add(lav);
        world.add(lav);
      } else if (c == yellow) {
        FBox ladders = new FBox(gridSize, gridSize);
        ladders.setName("ladders");
        ladders.attachImage(ladder);
        ladders.setStatic(true);
        ladders.setGrabbable(false);
        ladders.setSensor(true);
        ladders.setPosition(x*gridSize, y*gridSize);
        world.add(ladders);
      }
    }
  }
}
