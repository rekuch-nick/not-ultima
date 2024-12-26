function worldGen(){
	stage ++;
	fog = 0;
	inTown = false;
	floorTreasure = objPupCoins;
	
	lightLevel = 30;
	
	//reset
	with(objTile){ instance_destroy(); }
	with(objPup){ instance_destroy(); }
	with(objChar){
		if(id == pc){ continue; }
		instance_destroy();
	}
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		fmap[a, b] = imgTFloor;
		bmap[a, b] = imgTBlock;
		mmap[a, b] = noone;
		vmap[a, b] = fog;
	}}
	
	//force player onto even cords & update map
	if(pc.xSpot % 2 != 0){
		pc.xSpot = pc.xSpot > 5 ? pc.xSpot - 1 : pc.xSpot + 1;
		pc.ySpot = pc.ySpot > 5 ? pc.ySpot - 1 : pc.ySpot + 1;
	}
	pc.x = pc.xSpot * 64 + 32;
	pc.y = pc.ySpot * 64 + 32;
	mmap[pc.xSpot, pc.ySpot] = pc;
	pc.enterTrigger = true;
	
	
	if(pc.gotoTown){
		worldGenTown();
	} else {
	
	
	
		worldGenMaze(pc.xSpot, pc.ySpot);
		worldGenBConvert(imgTBlock, noone, 20);
		worldGenBConvert(imgTBlock, imgChest, 1);
		worldGenEnforcePillars(imgTBlock);
		//for(var a=0; a<W; a++){ for(var b=0; b<H; b++){ if(roll(30)){ bmap[a, b] = imgTBlock; } }}
	
	
	
		// empty player spot & place exits
		bmap[pc.xSpot, pc.ySpot] = noone;
		instance_create_depth(pc.xSpot * 64, pc.ySpot * 64, ww.layerPup, objPupStairsOut);
		
		
	}
	
	
	//implement
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		var t = fmap[a, b];
		if(t != noone){
			var o = tileObjFromSprite(t);
			fmap[a, b] = instance_create_depth(a * 64, b * 64, layerFloor - b, o);
			fmap[a, b].sprite_index = t;
		}
		
		var t = bmap[a, b];
		if(t != noone){
			var o = tileObjFromSprite(t);
			bmap[a, b] = instance_create_depth(a * 64, b * 64, layerBlock - b, o);
			bmap[a, b].sprite_index = t;
		}
	}}
	
	
	
	if(!inTown){
	
		var goalCords = findDistantEmptySpace(pc.xSpot, pc.ySpot);
		if(goalCords != noone){
			instance_create_depth(goalCords.a * 64, goalCords.b * 64, ww.layerPup, objPupGoal);
		} else {
			//TODO: handle no stair spot
		}
		
		if(!pc.gotFloorTreasure[stage]){
			var c = findEmptySpace();
			if(c != noone){
				c = instance_create_depth(c.a * 64, c.b * 64, ww.layerPup, floorTreasure);
				if(floorTreasure == objPupCoins){ c.val = 50; }
				c.isFloorTreasure = true;
			}
		}
		
		if(stage < 100){
			var c = findEmptySpace();
			if(c != noone){
				c = instance_create_depth(c.a * 64 + 32, c.b * 64 + 32, ww.layerPup, objPupGuide);
				if(!pc.seenTip[stage]){
					c.sprite_index = imgNPCGuideNew;
				}
			}
		}
		
	
		for(var i=1; i<=5; i++){
			var c = findEmptySpace();
			if(c != noone){
				c = instance_create_depth(c.a * 64, c.b * 64, ww.layerPup, objPupCoins);
				c.val = i;
			}
		}
		
	}
	
	
	
	state = State.play;
}