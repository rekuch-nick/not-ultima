function timePasses(){
	
	for(var i=0; i<4; i++){
		pc.party[i].mp = clamp(pc.party[i].mp + 1, 0, pc.party[i].mpMax);
	}
	
	with(objEncounter){
		readyTime += readyCharge;
	}

}