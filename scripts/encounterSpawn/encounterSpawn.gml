function encounterSpawn(){
	
	var o = objEncounter01;
	
	var tries = 0;
	while(tries < 1000){
		tries ++;
		var a = choose(true, false) ? pc.xSpot + irandom_range(3, 4) : pc.xSpot - irandom_range(3, 4);
		var b = choose(true, false) ? pc.ySpot + irandom_range(3, 4) : pc.ySpot - irandom_range(3, 4);
		
		if(!inBounds(a, b)){ continue; }
		if(ww.mmap[a, b] != noone){ continue; }
		if(ww.bmap[a, b] != noone){ continue; }
		
		ww.mmap[a, b] = instance_create_depth(a * 64 + 32, b * 64 + 32, ww.layerMob - b, o);
		return;
	}
	
	
	
}