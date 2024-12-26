enum State {
	title, play, status, battle, gen,
	choosingAction, choosingSkill, choosingItem, showingAction, waitingText,
	choosingTargetAttack, waitingActive,
	choosingTargetSkillAlly, choosingTargetItemAlly, 
	choosingTargetSkillFoe, choosingTargetItemFoe, 
	battleWon, battleLost, battleEscape,
	partySelect, shop,
	mapSkillChooseUser, mapSkillChooseSkill, mapSkillChooseTarget, mapSkillChooseDirection, mapSkillWait,
	promoteChooseWho,
	mapStats, mapItem, mapItemEquip, mapItemTarget,
}

enum Class {
	fighter, barbarian, paladin,
	ranger, rogue,
	bard, chemist, 
	cleric, sorcerer, druid, wizard,
}

enum Spell {
	heal, turn, life, smite,
	fire, root, ice, poison, warp, counterspell,
	light, open, sing, bomb, rage,
}

enum Passive { // not sure about this, but could help with player communicaiton...
	runner, quickStart, quickCharge
}


function scale(){
	image_xscale = 4; image_yscale = 4;
}

function inBounds(a, b){
	return a >= 0 && b >= 0 && a < ww.W && b < ww.H;
}

function roll(n){
	return irandom_range(0, 99) < n;
}

function disOrth(x1, y1, x2, y2){
	return abs(x1 - x2) + abs(y1 - y2);
}

function isDirection(s){
	return s == "UP" || s == "DOWN" || s == "LEFT" || s == "RIGHT";
}

function chestGold(){
	return irandom_range(max(1, ww.stage), max(99, ww.stage * 2));
}
