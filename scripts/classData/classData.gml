function getSpells(class, lvl){
	
	var lst = noone;
	var i = 0;
	
	if(class == Class.cleric){
		if(lvl >= 1){ lst[i] = Spell.heal; i++; }
		if(lvl >= 2){ lst[i] = Spell.turn; i++; }
	}
	
	if(class == Class.sorcerer){
		if(lvl >= 1){ lst[i] = Spell.fire; i++; }
		if(lvl >= 2){ lst[i] = Spell.light; i++; }
	}
	
	if(class == Class.druid){
		if(lvl >= 1){ lst[i] = Spell.heal; i++; }
		if(lvl >= 1){ lst[i] = Spell.fire; i++; }
	}
	
	if(class == Class.wizard){
		if(lvl >= 1){ lst[i] = Spell.heal; i++; }
		if(lvl >= 1){ lst[i] = Spell.fire; i++; }
	}
	
	if(class == Class.chemist){
		if(lvl >= 1){ lst[i] = Spell.fire; i++; }
	}
	
	if(class == Class.bard){
		
	}
	
	if(class == Class.paladin){
		if(lvl >= 3){ lst[i] = Spell.heal; i++; }
		if(lvl >= 1){ lst[i] = Spell.turn; i++; }
	}
	
	if(class == Class.ranger){
		if(lvl >= 2){ lst[i] = Spell.heal; i++; }
	}
	
	if(class == Class.rogue){
		if(lvl >= 1){ lst[i] = Spell.open; i++; }
	}
	
	if(class == Class.fighter){
		
	}
	
	if(class == Class.barbarian){
		
	}
	
	
	
	return lst;
}




function spellName(s){
	if(s == Spell.heal){ return "HEAL"; }
	if(s == Spell.fire){ return "FIRE"; }
	if(s == Spell.turn){ return "TURN"; }
	if(s == Spell.light){ return "LIGHT"; }
	if(s == Spell.open){ return "OPEN"; }
	if(s == Spell.stun){ return "STUN"; }
}

function spellDesc(s){
	var str = spellName(s) + "          " + string(spellCost(s)) + " MP\n";
	
	if(s == Spell.heal){ str += "RESTORE SOME HP TO AN ALLY"; }
	if(s == Spell.fire){ str += "BURN FOES WITH MAGIC"; }
	if(s == Spell.turn){ str += "BANISH UNDEAD"; }
	if(s == Spell.light){ str += "GLOW LIKE A TORCH"; }
	if(s == Spell.open){ str += "UNLOCK A DOOR OR CHEST"; }
	if(s == Spell.stun){ str += "STOP ONE FOE"; }
	return str;
}

// 0 = no target, 1 = ally target, -1 = foe target
function spellNeedsTarget(s){
	if(s == Spell.heal){ return 1; }
	if(s == Spell.open){ return -1; }
	if(s == Spell.stun){ return -1; }
	return 0;
}



function spellCost(s){
	if(s == Spell.heal){ return 4; }
	if(s == Spell.fire){ return 4; }
	
	if(s == Spell.turn){ return 5; }
	if(s == Spell.light){ return 5; }
	
	
	if(s == Spell.open){ return 12; }
	if(s == Spell.stun){ return 12; }
	
	
	return 100;
}


function classDescription(c){
	if(c == Class.fighter){ return "Expert in weapons and armor with high stats."; }
	if(c == Class.barbarian){ return "Hard hitting attacker with lots of HP."; }
	if(c == Class.rogue){ return "Fast, evasive attacker. Can open locks without a key. Good at running."; }
	if(c == Class.ranger){ return "Hard hitting attacker with limited spells and evasive ability."; }
	if(c == Class.paladin){ return "Tanky attacker that can cast low level cleric spells."; }
	if(c == Class.bard){ return "Decent attacker with song and healing magic."; }
	if(c == Class.chemist){ return "Arcane mage with a few uncommon spells. Good stats for a mage."; }
	if(c == Class.cleric){ return "Healing spells will cure poison and sometimes affect the whole party. "; }
	if(c == Class.druid){ return "Can cast a mix of cleric and arcane spells. Regains MP twice as quickly."; }
	if(c == Class.sorcerer){ return "Arcane mage with a very high max MP."; }
	if(c == Class.wizard){ return "Mage that learns every spell eventually."; }
	
	return "...";
}






