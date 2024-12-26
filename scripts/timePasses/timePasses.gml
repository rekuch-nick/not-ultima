function timePasses(){
	
	for(var i=0; i<4; i++){
		var c = pc.party[i];
		if(c != noone){
			var gain = c.class == Class.druid ? 2 : 1;
			c.mp = clamp(c.mp + gain, 0, c.mpMax);
		}
		
	}
	
	with(objEncounter){
		readyTime += readyCharge;
	}
	
	
	
	//if(instance_number(objEncounter) < 1 ){
	if(instance_number(objEncounter) < 1 || roll(15)){
		encounterSpawn();
	}
	
}