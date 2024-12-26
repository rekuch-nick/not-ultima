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
		if(lvl >= 1){ lst[i] = Spell.turn; i++; }
		if(lvl >= 1){ lst[i] = Spell.root; i++; }
		if(lvl >= 1){ lst[i] = Spell.light; i++; }
		if(lvl >= 1){ lst[i] = Spell.life; i++; }
		if(lvl >= 1){ lst[i] = Spell.ice; i++; }
		if(lvl >= 1){ lst[i] = Spell.open; i++; }
		if(lvl >= 1){ lst[i] = Spell.bomb; i++; }
		if(lvl >= 1){ lst[i] = Spell.smite; i++; }
		if(lvl >= 1){ lst[i] = Spell.poison; i++; }
		if(lvl >= 1){ lst[i] = Spell.counterspell; i++; }
		if(lvl >= 1){ lst[i] = Spell.warp; i++; }
		if(lvl >= 1){ lst[i] = Spell.sing; i++; }
		if(lvl >= 1){ lst[i] = Spell.rage; i++; }
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
	if(s == Spell.root){ return "ROOT"; }
	
	return "..."
}

function spellDesc(s){
	var str = spellName(s) + "          " + string(spellCost(s)) + " MP\n";
	
	if(s == Spell.heal){ str += "RESTORE SOME HP TO AN ALLY"; }
	if(s == Spell.fire){ str += "BURN FOES WITH MAGIC"; }
	if(s == Spell.turn){ str += "BANISH UNDEAD"; }
	if(s == Spell.light){ str += "GLOW LIKE A TORCH"; }
	if(s == Spell.open){ str += "UNLOCK A DOOR OR CHEST"; }
	if(s == Spell.root){ str += "SUMMON VINES TO TANGLE"; }
	return str;
}

// 0 = no target, 1 = ally target, -1 = foe target
function spellNeedsTarget(s){
	if(s == Spell.heal){ return 1; }
	if(s == Spell.open){ return -1; }
	if(s == Spell.warp){ return -1; }
	
	
	var inCombat = instance_number(objScreenBattle) > 0;
	//if(s == Spell.root && inCombat){ return 0; }
	if(s == Spell.root && !inCombat){ return -1; }
	
	if(s == Spell.fire && !inCombat){ return -1; }
	
	return 0;
}



function spellCost(s){
	if(s == Spell.heal){ return 10; }
	if(s == Spell.fire){ return 10; }
	if(s == Spell.turn){ return 10; }
	if(s == Spell.light){ return 10; }
	
	if(s == Spell.root){ return 15; }
	if(s == Spell.open){ return 15; }
	if(s == Spell.bomb){ return 15; }
	if(s == Spell.rage){ return 15; }
	if(s == Spell.sing){ return 15; }
	
	if(s == Spell.life){ return 20; }
	if(s == Spell.ice){ return 20; }
	if(s == Spell.poison){ return 20; }
	if(s == Spell.counterspell){ return 20; }
	
	if(s == Spell.warp){ return 25; }
	if(s == Spell.smite){ return 25; }
	
	
	return 100;
}


function classDescription(c){
	if(c == Class.fighter){ return "Expert in weapons and armor with high stats."; }
	if(c == Class.barbarian){ return "Hard hitting attacker with lots of HP."; }
	if(c == Class.rogue){ return "Fast, evasive attacker. Can open locks without a key. Good at running."; }
	if(c == Class.ranger){ return "Hard hitting attacker with limited spells and evasive ability."; }
	if(c == Class.paladin){ return "Tanky attacker that can cast low level cleric spells."; }
	if(c == Class.bard){ return "Decent attacker with song and healing magic."; }
	if(c == Class.chemist){ return "Arcane mage with a few uncommon spells. Good attack and defense stats for a mage."; }
	if(c == Class.cleric){ return "Mage with the best healing spells."; }
	if(c == Class.druid){ return "Can cast a mix of cleric and arcane spells. Regains MP twice as quickly."; }
	if(c == Class.sorcerer){ return "Arcane mage with a very high max MP."; }
	if(c == Class.wizard){ return "Mage that learns every spell eventually."; }
	
	return "...";
}






