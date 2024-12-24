function buildCharMenu(){
	menu = noone;
	menuRef = noone;
	
	addCharIfNotInParty(pc.batFighter);
	addCharIfNotInParty(pc.batRog);
	addCharIfNotInParty(pc.batSorc);
	addCharIfNotInParty(pc.batDruid);
	
	addCharIfNotInParty(pc.batBarb);
	addCharIfNotInParty(pc.batPal);
	addCharIfNotInParty(pc.batRng);
	addCharIfNotInParty(pc.batBard);
	addCharIfNotInParty(pc.batAlch);
	addCharIfNotInParty(pc.batClr);
	addCharIfNotInParty(pc.batWiz);
	
	/*
	var i = 0;
	
	with(objBattleChar){
		if(aly != 1){ continue; }
		if(id == other.party[0]){ continue; }
		if(id == other.party[1]){ continue; }
		if(id == other.party[2]){ continue; }
		if(id == other.party[3]){ continue; }
		
		other.menu[i] = nam;
		other.menuRef[i] = id;
		i ++;
	}*/
}

function addCharIfNotInParty(c){
	var i = array_length(menu);
	
	if(party[0] == c){ return; }
	if(party[1] == c){ return; }
	if(party[2] == c){ return; }
	if(party[3] == c){ return; }
	
	menu[i] = c.nam;
	menuRef[i] = c;
	
}