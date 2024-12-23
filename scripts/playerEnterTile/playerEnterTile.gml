function playerEnterTile(){
	
	for(var a=xSpot-2; a<=xSpot+2; a++){
		for(var b=ySpot-2; b<=ySpot+2; b++){
			if(!inBounds(a, b)){ continue; }
			revealTile(a, b);
		}
	}
	
	
	with(objPupCoins){
		if(pc.xSpot == xSpot && pc.ySpot == ySpot){
			pc.coins += val;
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
	
	
	
	
	if(ww.inTown){ return; }
	
	timePasses();
	
	
	
	
	if(instance_number(objEncounter) < 1 ){
	//if(instance_number(objEncounter) < 1 || roll(15)){
		encounterSpawn();
	}
	
	
	
}