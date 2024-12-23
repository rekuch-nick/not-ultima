function findDistantEmptySpace(a, b){
	
	var maxPossible = (10 - a) + (10 - b);
	
	var tries = 0;
	while(tries < 1000){
		tries ++;
		if(roll(5)){ maxPossible --; }
		
		var aa = irandom_range(0, 10);
		var bb = irandom_range(0, 10);
		
		if(ww.bmap[aa, bb] != noone){ continue; }
		
		var dis = disOrth(a, b, aa, bb);
		if(dis < maxPossible){ continue; }
		
		if(a == aa && b == bb){ continue; }
		
		var pupThere = false;
		with(objPup){
			if(xSpot == aa && ySpot == bb){ pupThere = true; break; }
		}
		if(pupThere){ continue; }
		
		
		return { a: aa, b: bb };
	}
	
	return noone;
}

function findEmptySpace(){
	var tries = 0;
	while(tries < 400){
		tries ++;
		
		var aa = irandom_range(0, 10);
		var bb = irandom_range(0, 10);
		
		if(ww.bmap[aa, bb] != noone){ continue; }
		if(pc.xSpot == aa && pc.ySpot == bb){ continue; }		
		var pupThere = false;
		with(objPup){
			if(xSpot == aa && ySpot == bb){ pupThere = true; break; }
		}
		if(pupThere){ continue; }
		return { a: aa, b: bb };
	}
	
	return noone;
}