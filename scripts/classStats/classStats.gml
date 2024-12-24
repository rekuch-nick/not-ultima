function setStats(c){
	with(c){
		hpMax = gainHP(class) * (lvl + 1);
		mpMax = gainMP(class) * (lvl + 1);
			if(class == Class.rogue){ mpMax += 11; } // enough to pick 1 lock
		hits = 1 + floor( gainHits(class) * lvl);
		dmgMin = floor(gainDmgMin(class) * lvl);
		dmgMax = 4 + (gainDmgMax(class) * lvl);
		def = round(gainDef(class) * lvl);
		speedMin = 4 + floor(gainSpeed(class) * lvl);
		speedMax = 7 + round(gainSpeed(class) * lvl);
		
		evade = gainEvade(class, lvl);
	}
}

function gainHP(cc){
	switch(cc){
		case Class.barbarian:
			return 20;
		case Class.fighter:
		case Class.paladin:
		case Class.ranger:
		case Class.chemist:
			return 15;
		case Class.rogue:
		case Class.bard:
			return 10;
		case Class.cleric:
		case Class.druid:
		case Class.sorcerer:
		case Class.wizard:
			return 5;
	}
}

function gainMP(cc){
	switch(cc){
		case Class.sorcerer:
			return 6;
		case Class.cleric:
		case Class.druid:
		case Class.wizard:
			return 4;
		case Class.chemist:
		case Class.bard:
			return 3;
		case Class.paladin:
		case Class.ranger:
			return 2;
		case Class.rogue:
		case Class.barbarian:
			return 1;
		case Class.fighter:
			return 0;
	}
}

function gainHits(cc){
	switch(cc){
		case Class.barbarian:
		case Class.fighter:
		case Class.ranger:
		case Class.rogue:
			return .4;
		case Class.paladin:
		case Class.bard:
			return .3;
		case Class.chemist:
		case Class.cleric:
			return .2;		
		case Class.druid:
		case Class.sorcerer:
		case Class.wizard:
			return .1;
	}
}

function gainDmgMax(cc){
	switch(cc){
		case Class.barbarian:
		case Class.fighter:
			return 4;
		case Class.ranger:
		case Class.paladin:
		case Class.bard:
			return 3;
		case Class.rogue:
		case Class.chemist:
		case Class.cleric:
			return 2;		
		case Class.druid:
		case Class.sorcerer:
		case Class.wizard:
			return 1;
	}
}

function gainDmgMin(cc){
	switch(cc){
		case Class.fighter:
		case Class.ranger:
			return 2.5;
		case Class.paladin:
		case Class.bard:
			return 2;
		case Class.barbarian:
		case Class.rogue:
		case Class.chemist:
		case Class.cleric:
			return 1.5;		
		case Class.druid:
		case Class.sorcerer:
		case Class.wizard:
			return 1;
	}
}

function gainDef(cc){
	switch(cc){
		case Class.fighter:
		case Class.paladin:
			return 1.2;
		case Class.ranger:
			return .8;
		case Class.barbarian:
		case Class.chemist:
		case Class.rogue:
		case Class.bard:
			return .6;
		case Class.cleric:
			return .4;
		case Class.druid:
		case Class.sorcerer:
		case Class.wizard:
			return .3;
	}
}


function gainSpeed(cc){
	switch(cc){
		case Class.rogue:
			return .8;
		case Class.ranger:
		case Class.fighter:
			return .7;
		case Class.barbarian:
			return .6;
		case Class.chemist:
		case Class.bard:
			return .5;
		case Class.paladin:
		case Class.cleric:
		case Class.druid:
		case Class.sorcerer:
		case Class.wizard:
			return .4;
	}
}

function gainEvade(cc, lvl){
	switch(cc){
		case Class.rogue:
			return lvl >= 8 ? 40 : 20;
		case Class.ranger:
			return lvl >= 8 ? 30 : 10;
		case Class.barbarian:
		case Class.chemist:
			return lvl >= 8 ? 20 : 10;
		case Class.fighter:
		case Class.bard:
			return lvl >= 8 ? 10 : 5;
		case Class.paladin:
		case Class.cleric:
		case Class.druid:
		case Class.sorcerer:
		case Class.wizard:
			return 0;
	}
}