function playerHasItem(i1){
	
	for(var i=0; i<15; i++){
		var i2 = pc.inventory[i];
		if(i2 == noone){ continue; }
		if(i1.nam == i2.nam){ return true; }
	}
	
	return false;
}

function playerHasItemAt(i1){
	for(var i=0; i<15; i++){
		var i2 = pc.inventory[i];
		if(i2 == noone){ continue; }
		if(i1.nam == i2.nam){ return i; }
	}
	
	return -1;
}

function playerHasAnyItem(){
	for(var i=0; i<15; i++){
		if(pc.inventory[i] != noone){ return true; }
	}
	return false;
}

function playerCanGainItem(itm){
	if(itm.stackable && playerHasItem(itm)){ return true; }
	if(playerLowestEmptySlot() != -1){ return true; }
	return false;
	
}

function playerGainItem(itm, n){
	if(is_undefined(n)){ n = 1; }
	if(itm.stackable && playerHasItem(itm)){
		pc.inventory[playerHasItemAt(itm)].stacks += n;
	} else {
		var i = playerLowestEmptySlot();
		pc.inventory[i] = itm;
		pc.inventory[i].stacks = n;
	}
}

function playerLoseItem(itm){
	var i = playerHasItemAt(itm);
	pc.inventory[i].stacks --;
	if(pc.inventory[i].stacks < 1){
		pc.inventory[i] = noone;
	}
}

function playerLowestEmptySlot(){
	for(var i=0; i<15; i++){
		if(pc.inventory[i] == noone){ return i; }
	}
	return -1;
}

function itemNeedsTarget(itm){
	if(itm.type != Item.consumable && itm.type != Item.unlimited){
		return 0;
	}
	if(itm.spell != noone){
		return spellNeedsTarget(itm.spell);
	}
	
	if(itm.nam == "PAINT"){ return -1; } ///
	
	return 0;
}

enum Item {
	consumable, unlimited, wep, arm, rng, null,
}