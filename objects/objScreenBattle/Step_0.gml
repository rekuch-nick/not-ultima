if(image_alpha < 1){
	image_alpha += .04;
	image_alpha += .04;
	if(image_alpha >= 1){
		var aa = ww.mobRowFront;
		var bb = 96;
		for(var i=0; i<array_length(encounter.mobs); i++){
			if(i > 0){
				bb += 64 * 2
				if(bb >= 64 * 8){ bb = 96; aa = ww.mobRowBack; }
			}
			if(encounter.mobs[i] == noone){ continue; }
			var mm = instance_create_depth(aa, bb, ww.layerScreen - 1, encounter.mobs[i]);
			goldPot += mm.coins;
		}
		state = State.waitingActive;
		active = noone;
		
		with(objBattleChar){ ct = 0; }
	}
	return;
}


var hold = false;
with(objEff){ if(holdBattle){
	hold = true;
	break;
}}
if(hold && displayTime == 1){ displayTime ++; }

if(displayTime > 0){
	displayTime --;
	if(ww.holdingWait){ displayTime = 0; }
	if(displayTime < 1){
		if(ds_list_size(battleMessage) > 0){
			ds_list_delete(battleMessage, 0);
			if(ds_list_size(battleMessage) > 0){
				displayTime = displayTimeMax;
			}
		}
		if(displayTime < 1){
			with(objBattleChar){
				x = xStart;
				depth = depthStart;
			}
		}
	}
		
	return;
} /// end of display message


if(state == State.battleWon){
	instance_destroy(encounter);
	ww.state = State.play;
	instance_destroy();
}

if(state == State.battleEscape){
	with(objBattleChar){ if(aly != 1){ instance_destroy(); }}
	instance_destroy(encounter);
	ww.state = State.play;
	instance_destroy();
}


if(state == State.waitingActive){
	var numOfAlyUp = 0;
	var numOfMobUp = 0;
	with(objBattleChar){
		if(aly != 1 || inParty){
			if(hp > 0){
				ct += irandom_range(speedMin, speedMax); //
				if(aly){ numOfAlyUp ++; }
				if(!aly){ numOfMobUp ++; }
			} else {
				ct = 99; // want rezzed units to act semi-instantly
			}
		}
	}
	
	///check for battle over
	if(numOfAlyUp == 0){
		ds_list_add(battleMessage, "PARTY DEFEATED...");
		displayTime = displayTimeMax * 1.5;
		state = State.battleLost;
	}
	if(numOfMobUp == 0){
		ds_list_add(battleMessage, "FOES DEFEATED!");
		if(goldPot > 0){
			ds_list_add(battleMessage, "FOUND $ " + string(goldPot));
			pc.coins += goldPot
		}
		displayTime = displayTimeMax * 1.5;
		state = State.battleWon;
		return;
	}
	

	var bestID = noone;
	var bestVal = 0;

	with(objBattleChar){
		if(ct >= 100 && ct > bestVal){
			bestID = id;
			bestVal = ct;
		}
	}

	active = bestID;
	if(active != noone){
		state = State.choosingAction;
	}
	return;
} /// end of state = waiting for active unit






if(state == State.choosingAction){
	if(active == noone){ state = State.waitingActive; return; }
	
	if(active.aly == 1){
		if(menu == noone){ 
			menu = menuPopulateBattle(active); 
			cur = active.lastActionCursor;
		}
		
		var action = menuInput();
		
		if(action == "FIGHT"){
			active.lastActionCursor = 0;
			state = State.choosingTargetAttack;
			menu = menuPopulateFoe(active);
			cur = 0; /// replace with ref to active.lastAction & bounds check ?
			return;
		}
		
		if(action == "SKILL"){
			active.lastActionCursor = 1;
			menu = menuPopulateSkill(active);
			if(menu == noone){
				ds_list_add(battleMessage, "NO SKILLS KNOWN");
				displayTime = displayTimeMax;
				state = State.choosingAction;
				cur = 1; // correct, places cur on SKILL
				menuRef = noone;
			} else {
				state = State.choosingSkill;
				cur = active.lastSkillCursor;
			}
			return;
		}
		
		if(action == "DEFEND"){
			active.lastActionCursor = 3;
			active.ct -= 100;
			active = noone;
			state = State.waitingActive;
			menu = noone;
			return;
		}
		
		if(action == "RUN"){
			active.lastActionCursor = 4;
			var dc = encounter.runDiff + active.runBonus;
			if(encounter.runImpossible){
				ds_list_add(battleMessage, "ESCAPE IS IMPOSSIBLE!!");
				displayTime = displayTimeMax * 1.5;
				active.ct -= 100;
				state = State.waitingActive;
			} else if(roll(dc)){
				ds_list_add(battleMessage, "GOT AWAY...");
				displayTime = displayTimeMax * 1.5;
				state = State.battleEscape;
			} else {
				ds_list_add(battleMessage, active.nam + " COULDN'T GET AWAY.");
				active.ct -= 100;
				state = State.waitingActive;
			}
			active = noone;
			menu = noone;
			return;
		}
	} /// end of aly choose action
	
	
	
	if(active.aly != 1){ // mob chooses action
		mobTurn(active);
		active.ct -= 100;
		active = noone;
		state = State.waitingActive;
		return;
	} /// end of mobs choose action
	
	
	
} /// end of state = choosing action

if(state == State.choosingSkill){
	if(menu == noone){ menu = menuPopulateSkill(active); }
	var action = menuInput();
	
	if(action == "NO"){
		active.lastSkillCursor = cur;
		state = State.choosingAction;
		cur = 1; // places cur on SKILL
		menu = noone;
		menuRef = noone;
	} else if(action != ""){
		casting = menuRef[cur];
		active.lastSkillCursor = cur;
		if(spellNeedsTarget(casting) == 0){ // no target
			castCombat(active, casting, noone);
			active.x = active.xForward;
			active = noone;
			state = State.waitingActive;
			menu = noone;
			menuRef = noone;
			cur = 0;
			
		} else if(spellNeedsTarget(casting) == 1){ // ally target
			
			active.lastSkillCursor = cur;
			state = State.choosingTargetSkillAlly;
			menu = menuPopulateAlly();
			cur = 0; /// replace with ref to active.lastAction & bounds check ?
			
		} else { // foe target
			active.lastSkillCursor = cur;
			state = State.choosingTargetSkillFoe;
			menu = menuPopulateFoe(active);
			cur = 0; /// replace with ref to active.lastAction & bounds check ?
			
		}
		
	}
	
	
	return;
}
	
	
if(state == State.choosingTargetAttack){
	var action = menuInput();
	menuXSelect();
	
	if(action == "NO"){
		state = State.choosingAction;
		cur = 0; // places cur on FIGHT
		menu = noone;
		menuRef = noone;
	} else if(action != ""){
		fight(active, menuRef[cur]);
		active.ct -= 100;
		active.x = active.xForward;
		active = noone;
		state = State.waitingActive;
		menu = noone;
		menuRef = noone;
		cur = 0;
	}
	
	
	return;
} // end of state = shoosing target



if(state == State.choosingTargetSkillFoe || state == State.choosingTargetSkillAlly){
	
	var action = menuInput();
	if(state == State.choosingTargetSkillFoe){ menuXSelect(); }
	
	if(action == "NO"){
		state = State.choosingSkill;
		cur = active.lastSkillCursor;
		menu = noone;
		menuRef = noone;
	} else if(action != ""){
		castCombat(active, casting, menuRef[cur]);
		active.x = active.xForward;
		active = noone;
		state = State.waitingActive;
		menu = noone;
		menuRef = noone;
		cur = 0;
	}
	return;
} // end of state = choosing target for skill







