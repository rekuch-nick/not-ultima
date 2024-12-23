function mobTurn(c1){
	
	//assume attack for now
	
	//TODO: handle party down / untargetable
	if( (pc.party[0] == noone || pc.party[0].hp < 1) &&
			(pc.party[1] == noone || pc.party[1].hp < 1) &&
			(pc.party[2] == noone || pc.party[2].hp < 1) &&
			(pc.party[3] == noone || pc.party[3].hp < 1) ){
				
		return;
	}
	
	do{
		var r = irandom_range(1, 8);
		var t = 0;
		if(r >= 5 && r <= 6){ t = 1; }
		if(r == 7){ t = 2; }
		if(r == 8){ t = 3; }
		var tIsOK = pc.party[t] != noone && pc.party[t].hp > 0;
		
	} until (tIsOK);
	
	c1.x = c1.xForward;
	c1.depth -= 2;
	fight(c1, pc.party[t]);
	
}