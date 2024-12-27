function castCombat(caster, spell, target){
	
	var cost = spellCost(spell);
	var pow = caster.lvl + caster.spellPowerPlus;
	
	if(caster.mp < cost){
		ds_list_add(battleMessage, "NOT ENOUGH MP");
		displayTime = displayTimeMax;
		caster.ct -= 50;
		return;
	}
	
	if(spell == Spell.fire){
		
		with(objBattleChar){ if(aly == -1){
			var might = pow + irandom_range(1, 4);
			instance_create_depth(x, y, depth - 10, effFire);
			instance_create_depth(x, y - 32, ww.layerEff, effTxt, { txt: might, });
			spellDamage(might, id);
		}}
		ds_list_add(battleMessage, active.nam + " CAST FIRE");
	}
	
	if(spell == Spell.turn){
		var deadHit = 0;
		var deadTurned = 0;
		with(objBattleChar){ if(aly == -1){
			if(!undead){ continue; }
			deadHit ++;
			if(pow < turnResist){ continue; }
			//var might = caster.lvl + irandom_range(1, 4);
			var might = hp;
			instance_create_depth(x, y, depth - 10, effFireTurn);
			instance_create_depth(x, y - 32, ww.layerEff, effTxt, { txt: might, });
			spellDamage(might, id);
			deadTurned ++;
		}}
		if(deadHit == 0){
			ds_list_add(battleMessage, "THERE'S NO UNDEAD TO TURN");
		} else if (deadTurned == 0) {
			ds_list_add(battleMessage, active.nam + " ISN'T STRONG ENOUGH TO TURN IT");
		} else {
			ds_list_add(battleMessage, active.nam + " TURNS UNDEAD");
		}
	}
	
	
	if(spell == Spell.heal){
		var might = (pow * 2) + irandom_range(1, 4) + irandom_range(1, 4);
		instance_create_depth(target.x, target.y, depth - 10, effHeal);
		instance_create_depth(x, y - 32, ww.layerEff, effTxt, { txt: might, txtCol: c_aqua});
		target.hp = clamp(target.hp + might, 0, target.hpMax);
		
		ds_list_add(battleMessage, active.nam + " CAST HEAL");
	}
	
	
	
	
	caster.mp -= cost;
	caster.ct -= 100;
	//ds_list_add(battleMessage, active.nam + " CAST A SPELL");
	displayTime = displayTimeMax;

}

function spellDamage(num, c){
	var bScreen = noone;
	with(objScreenBattle){ bScreen = id; }
	
	c.hp -= num;
	if(c.hp < 1){
		//ds_list_add(bScreen.battleMessage, c.nam + " IS DOWN");
		if(c.aly != 1){ instance_destroy(c); }
	}
}