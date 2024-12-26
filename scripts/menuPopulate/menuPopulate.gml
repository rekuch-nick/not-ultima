function menuPopulateBattle(char){
	return [
		"FIGHT",
		"SKILL",
		"ITEM",
		"DEFEND",
		"RUN"
	];
}

function menuPopulateSkill(char){
	menuRef = getSpells(char.class, char.lvl);
	if(menuRef == noone){ return noone; }
	var mn = [];
	for(var i=0; i<array_length(menuRef); i++){
		mn[i] = spellName(menuRef[i]);
	}
	return mn;
}

function menuPopulateAlly(){
	menuRef = noone;
	menuRef[0] = pc.party[0];
	menuRef[1] = pc.party[1];
	menuRef[2] = pc.party[2];
	menuRef[3] = pc.party[3];
	
	return [pc.party[0].nam, pc.party[1].nam, pc.party[2].nam, pc.party[3].nam];
}



function menuPopulateFoe(char){
	var mn = [];
	menuRef = noone;
	var i = 0;
	var numToAdd = 0;
	with(objBattleChar){
		if(aly != 1){
			numToAdd ++;
			needsAdded = true;
		}
	}
	
	
	while(numToAdd > 0){
		
		var best = noone;
		var bestPos = 1000000;
		
		with(objBattleChar){
			if(aly == 1){ continue; }
			if(!needsAdded){ continue; }
			
			var pos = xStart + floor(yStart / 10);
			if(pos < bestPos){
				best = id;
				bestPos = pos;
			}
		}
		
		mn[i] = best.nam;
		best.needsAdded = false;
		numToAdd --;
		menuRef[i] = best;
		i ++;
		
		
		
	}
	
	return mn;
}

function menuPopulateItem(){
	var mn = [];
	menuRef = noone;
	for(var i=0; i<15; i++){
		menuRef[i] = pc.inventory[i];
		if(pc.inventory[i] == noone){
			mn[i] = "";
		} else {
			mn[i] = pc.inventory[i].nam;
			if(pc.inventory[i].stacks > 1){
				mn[i] += " x " + string(pc.inventory[i].stacks);
			}
		}
	}
	return mn;
}

function menuPopulatePause(){
	return ["STATS", "SKILL", "ITEM"];
}