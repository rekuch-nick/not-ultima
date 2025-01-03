function playerEnterTile(){
	
	pc.lightTime = clamp(pc.lightTime - 1, 0, pc.lightTime);
	
	for(var a=xSpot-2; a<=xSpot+2; a++){
		for(var b=ySpot-2; b<=ySpot+2; b++){
			if(!inBounds(a, b)){ continue; }
			revealTile(a, b);
		}
	}
	
	
	with(objPupCoins){
		if(pc.xSpot == xSpot && pc.ySpot == ySpot){
			pc.coins += val;
			if(isFloorTreasure){ pc.gotFloorTreasure[ww.stage] = true; }
			instance_destroy();
		}
	}
	
	
	with(objPupGoal){
		if(pc.xSpot == xSpot && pc.ySpot == ySpot){
			
			var cord = findDistantEmptySpace(pc.xSpot, pc.ySpot);
			if(cord != noone){
				xSpot = cord.a;
				ySpot = cord.b;
				x = xSpot * 64;
				y = ySpot * 64;
			}
			
			val --;
			if(val < 1){
				instance_create_depth(x, y, depth, objPupStairs);
				instance_destroy();
				return;
			}
			
		}
	}
	
	
	if(ww.fmap[pc.xSpot, pc.ySpot] != noone){
		if(ww.fmap[pc.xSpot, pc.ySpot].sprite_index == imgTGrassInn){
			instance_create_depth(0, 0, ww.layerScreen, objScreenPartySelect);
		}
		
		if(ww.fmap[pc.xSpot, pc.ySpot].sprite_index == imgTGrassShop){
			instance_create_depth(0, 0, ww.layerScreen, objScreenShop);
		}
		
		if(ww.fmap[pc.xSpot, pc.ySpot].sprite_index == imgTGrassTemple){
			instance_create_depth(0, 0, ww.layerScreen, objScreenShop);
		}
	}
	
	
	if(ww.inTown){ return; }
	
	timePasses();
	
	
	
	
	
	
	
	
}