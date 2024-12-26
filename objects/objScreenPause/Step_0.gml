
if(state == State.mapSkillWait){
	if(instance_number(objEff) > 0){
		return;
	}
	state = nextState;
	if(state == State.play){
		instance_destroy();
		return;
	}
	nextState = noone;
}



var action = menuInput();

if(state == noone){
	if(action == "NO"){
		ww.state = State.play;
		instance_destroy();
	}

	if(action == "SKILL"){
		state = State.mapSkillChooseUser;
		txt = "WHO WILL USE A SKILL?";
		menu = menuPopulateAlly();
		cur = lastUser;
	}
	
	if(action == "STATS"){
		state = State.mapStats;
		menu = menuPopulateAlly();
		cur = lastUser;
	}
	
	if(action == "ITEM"){
		state = State.mapItem;
		cur = 0;
		menu = menuPopulateItem();
	}
	
	return;
}

if(state == State.mapSkillChooseUser){
	lastUser = cur;
	
	if(action == "NO"){
		state = noone;
		menuRef = 0;
		cur = 1;
		menu = menuPopulatePause();
	} else if(action != ""){
		caster = menuRef[cur];
		menuRef = noone;
		menu = menuPopulateSkill(caster);
		if(array_length(menu) < 1){
			txt = caster.nam + " HAS NO SKILLS TO USE";
			menuRef = noone;
			menu = menuPopulateAlly();
			cur = lastUser;
		}
		cur = lastSkill; 
		state = State.mapSkillChooseSkill;
	}
	return;	
}


if(state == State.mapSkillChooseSkill){
	txt = spellDesc(menuRef[cur]);
	lastSkill = cur;
	
	if(action == "NO"){
		state = State.mapSkillChooseUser;
		txt = "WHO WILL USE A SKILL?";
		menu = menuPopulateAlly();
		cur = lastUser;
	} else if(action != ""){
		spell = menuRef[cur];
		
		if(spellNeedsTarget(spell) == 1){ // aly
			state = State.mapSkillChooseTarget;
			txt = "USE " + spellName(spell) + " ON WHOM?";
			menu = menuPopulateAlly();
			cur = lastSkillTarget;
			
		} else if(spellNeedsTarget(spell) == -1) { //map location
			state = State.mapSkillChooseDirection;
			menu = ["DIR"];
			//menu = noone; menuRef = noone;
			
		} else {
			castMap(caster, spell, noone, "", false);
		}
	}
	return;
}

if(state == State.mapSkillChooseTarget){
	lastSkillTarget = cur;
	
	if(action == "NO"){
		state = State.mapSkillChooseSkill;
		menuRef = noone;
		menu = menuPopulateSkill(caster);
		cur = lastSkill; 
		
	} else if(action != ""){
		castMap(caster, spell, menuRef[cur], "", false);
	}
	
	return;
}

if(state == State.mapSkillChooseDirection){
	if(action == "NO"){
		state = State.mapSkillChooseSkill;
		menuRef = noone;
		menu = menuPopulateSkill(caster);
		cur = lastSkill; 
	} else if(isDirection(action)){
		if(pc.xSpot == 0 && action == "LEFT"){ return; }
		if(pc.xSpot >= 10 && action == "RIGHT"){ return; }
		if(pc.ySpot == 0 && action == "UP"){ return; }
		if(pc.ySpot >= 10 && action == "DOWN"){ return; }
		
		castMap(caster, spell, menuRef[cur], action, false);
		state = State.mapSkillWait;
		nextState = State.mapSkillChooseSkill;
		menuRef = noone;
		menu = menuPopulateSkill(caster);
		cur = lastSkill; 
		
	}
	
	
	return;
}




if(state == State.mapStats){
	lastUser = cur;
	
	if(action == "NO"){
		state = noone;
		menuRef = 0;
		cur = 0;
		menu = menuPopulatePause();
	}
	
	return;
}

if(state == State.mapItem){
	
	if(ww.yIn > 0){ itemDir = 1; }
	if(ww.yIn < 0){ itemDir = -1; }
	
	while(playerHasAnyItem() && menuRef[cur] == noone){
		cur += itemDir;
		if(cur > 14){ cur = 0; }
		if(cur < 0){ cur = 14; }
	}
	lastItem = cur;
	
	if(action == "NO"){
		state = noone;
		menuRef = 0;
		cur = 2;
		menu = menuPopulatePause();
	} else if(action != ""){
		var itm = menuRef[cur];
		
		if(itm.type == Item.wep || itm.type == Item.arm || itm.type == Item.rng){
			
		} else if(itemNeedsTarget(itm) == -1){ //pick dir
			itemToUse = itm;
			state = State.mapItemTarget;
			menu = ["DIR"];
			
			
		} else {// auto target
			itemToUse = itm;
			var cast = castMap(noone, itemToUse.spell, menuRef[cur], action, true);
			if(cast && itemToUse.type == Item.consumable){
				playerLoseItem(itemToUse);
			}
			itemToUse = noone;
			state = State.mapSkillWait;
			nextState = State.play;
			menuRef = noone;
			menu = menuPopulateItem();
			cur = lastItem;
			
		}
	}
	
	return;
}





if(state == State.mapItemTarget){
	if(action == "NO"){
		state = State.mapItem;
		menuRef = noone;
		menu = menuPopulateItem();
		cur = lastItem; 
	} else if(isDirection(action)){
		if(pc.xSpot == 0 && action == "LEFT"){ return; }
		if(pc.xSpot >= 10 && action == "RIGHT"){ return; }
		if(pc.ySpot == 0 && action == "UP"){ return; }
		if(pc.ySpot >= 10 && action == "DOWN"){ return; }
		
		
		var cast = castMap(noone, itemToUse.spell, menuRef[cur], action, true);
		if(cast && itemToUse.type == Item.consumable){
			playerLoseItem(itemToUse);
		}
		itemToUse = noone;
		state = State.mapSkillWait;
		nextState = State.play;
		menuRef = noone;
		menu = menuPopulateItem();
		cur = lastItem;
	}
	
	
	return;
}







