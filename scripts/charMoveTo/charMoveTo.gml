function charMoveTo(a, b){
	xLast = xSpot;
	yLast = ySpot;
	
	var moveCreatesCombat = false;
	var inTargetSpot = ww.mmap[a, b];
	
	if(inTargetSpot != noone){
		if(inTargetSpot.aly == aly * -1){
			moveCreatesCombat = true;
		}
	}
	
	if(moveCreatesCombat){
		
		
		ww.encounter = ww.mmap[a, b].id == pc ? ww.mmap[xSpot, ySpot] : ww.mmap[a, b];
		ww.mmap[xSpot, ySpot] = noone;
		ww.mmap[a, b] = pc;
		
	} else {
	
	
		ww.mmap[a, b] = ww.mmap[xSpot, ySpot];
		ww.mmap[xSpot, ySpot] = inTargetSpot;
	
		if(inTargetSpot != noone){
			inTargetSpot.xSpot = xSpot;
			inTargetSpot.ySpot = ySpot;
		}
		
	}
	
	xSpot = a;
	ySpot = b;
	enterTrigger = true;
}