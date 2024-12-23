function setParty(c1, c2, c3, c4){
	
	with(objBattleChar){ x = -96; y = 0; inParty = false; }
	
	setChar(c1, 0);
	setChar(c2, 1);
	setChar(c3, 2);
	setChar(c4, 3);
	
}

function setChar(c, i){
	party[i] = noone;
	if(c != noone){
		party[i] = c;
		c.x = 64 * 4;
		c.y = 96 + ((i * 2) * 64);
		c.xStart = 64 * 4;
		c.xForward = 64 * 5;
		c.inParty = true;
	}
}