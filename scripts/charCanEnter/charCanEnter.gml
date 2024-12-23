function charCanEnter(a, b){
	if(!inBounds(a, b)){ return false; }
	if(xSpot == a && ySpot == b){ return true; }
	if(!passWall && ww.bmap[a, b] != noone){ return false; }
	
	
	var m = ww.mmap[a, b];
	if(m != noone){
		//if(!id == pc){ return; }
		
		if(m.aly == aly * -1){ 
			//return false; 
		}
		if(m.aly == aly && !passAly){ return false; }
		if(m.aly == 0 && !passNPC){ return false; }
		
	}
	
	return true;
}