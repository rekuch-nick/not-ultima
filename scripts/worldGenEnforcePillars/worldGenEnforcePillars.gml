function worldGenEnforcePillars(o){
	
	for(var a=1; a<W-1; a++){ for(var b=1; b<H-1; b++){
		
		var empties = 0;
		for(var aa=a-1; aa<=a+1; aa++){ for(var bb=b-1; bb<=b+1; bb++){
			if(bmap[aa, bb] == noone){ empties ++; }
		}}
		
		if(empties == 9){
			bmap[a, b] = o;
		}
		
	}}
	
	
}