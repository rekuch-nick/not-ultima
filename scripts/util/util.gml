enum State {
	title, play, status, battle, gen,
	choosingAction, choosingSkill, choosingItem, showingAction, waitingText,
	choosingTargetAttack, waitingActive,
	choosingTargetSkillAlly, choosingTargetItemAlly, 
	choosingTargetSkillFoe, choosingTargetItemFoe, 
	battleWon, battleLost, battleEscape,
}

enum Class {
	fighter, barbarian, paladin,
	ranger, rogue,
	bard, chemist, 
	cleric, sorcerer, druid, wizard,
}

enum Spell {
	heal, turn, pure, life,
	fire, light, hedge, warp, stun,
	open,
	valor,
	bomb,
	morph,
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

