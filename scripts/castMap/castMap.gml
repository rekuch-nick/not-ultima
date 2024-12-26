function castMap(caster, spell, target, dir, ignoreMP){
	
	var casterless = false;
	if(caster == noone){
		caster = pc.party[0];
		casterless = true;
	}
	
	var cost = spellCost(spell);
	if(ignoreMP){ cost = 0; }
	var xx = pc.xSpot;
	if(dir == "LEFT"){ xx --; }
	if(dir == "RIGHT"){ xx --; }
	var yy = pc.ySpot;
	if(dir == "UP"){ yy --; }
	if(dir == "DOWN"){ yy ++; }
	
	var ll = ww.layerScreen - 10;
	
	
	if(caster.mp < cost){
		var s = instance_create_depth(64 * 5.5, room_height / 2, ll, effToast);
		s.txt = "NOT ENOUGH MP";
		return;
	}
	
	caster.mp -= cost;
	
	if(spell == Spell.fire){
		instance_create_depth(xx * 64 + 32, yy * 64 + 32, ll, effMapFire);
		
		with(objEncounter01){
			if(xx == xSpot && yy == ySpot ){
				ww.mmap[xSpot, ySpot] = noone; instance_destroy();
			}
		}
		
		//var s = instance_create_depth(64 * 5.5, room_height / 2, depth - 10, effToast);
		//s.txt = "NO EFFECT";
		return true;
	}
	
	
	
	
	if(spell == Spell.heal){
		if(target.hp >= target.hpMax){
			caster.mp += cost;
			var s = instance_create_depth(64 * 5.5, room_height / 2, ll, effToast);
			s.txt = string(target.nam) + " IS ALREADY AT FULL HP";
			return false;
		}
		
		var might = (caster.lvl * 2) + irandom_range(1, 4) + irandom_range(1, 4);
		target.hp = clamp(target.hp + might, 0, target.hpMax);
		var s = instance_create_depth(64 * 5.5, room_height / 2, ll, effToast);
		s.txt = "HEALED " + string(target.nam);
		return true;
	}
	
	
	
	if(spell == Spell.open){
		//instance_create_depth(xx * 64 + 32, yy * 64 + 32, depth - 10, effMapFire);
		var opened = false;
		with(objChest){
			if(xx == xSpot && yy == ySpot ){
				if(item == noone || !playerCanGainItem(item)){
					var v = chestGold();
					pc.coins += v;
					var s = instance_create_depth(64 * 5.5, room_height / 2, ll, effToast);
					s.txt = "FOUND " + string(v) + " GOLD COINS";
					opened = true;
				} else {
					playerGainItem(item, val);
					var s = instance_create_depth(64 * 5.5, room_height / 2, ll, effToast);
					s.txt = "FOUND " + string(item.nam);
					if(val > 1){
						s.txt += " x " + string(val);
					}
					opened = true;
				}
				
				ww.bmap[xSpot, ySpot] = noone; instance_destroy();
			}
		}
		if(!opened){
			var s = instance_create_depth(64 * 5.5, room_height / 2, ll, effToast);
			s.txt = "NO EFFECT";
		}
		return opened;
	}
	
	
	if(spell == Spell.light){
		var cap = 59;
		if(!casterless){
			cap = max(cap, caster.lvl * 10) + 9;
		} else {
			if(itemToUse.nam == "GREAT TORCH"){
				cap = 109;
			}
		}
		if(pc.lightTime < cap){
			var s = instance_create_depth(64 * 5.5, room_height / 2, ll, effToast);
			s.txt = "LIGHT SHINES AROUND THE PARTY";
			pc.lightTime = cap;
			return true;
		} else {
			var s = instance_create_depth(64 * 5.5, room_height / 2, ll, effToast);
			s.txt = "THIS WON'T MAKE IT ANY BRIGHTER";
			return false;
		}
	}
	

}

