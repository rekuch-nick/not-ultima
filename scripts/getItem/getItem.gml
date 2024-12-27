function getItem(s){
	var itm = {
		nam: s,
		stackable: false,
		stacks: 1,
		img: imgPupCoin,
		desc: "...",
		typ: Item.consumable,
		spell: noone,
		bonus: 0,
		cost: 100,
	}
	
	if(s == "TORCH"){
		itm.stackable = true;
		itm.desc = "USE TO MAKE LIGHT";
		itm.spell = Spell.light;
		itm.cost = 2;
	}
	
	if(s == "KEY"){
		itm.stackable = true;
		itm.desc = "USE OPEN LOCKS";
		itm.spell = Spell.open;
		itm.cost = 50;
	}
	
	if(s == "ROCK"){
		itm.stackable = false;
		itm.desc = "KINDA HEAVY";
		itm.typ = Item.null;
		itm.cost = 2;
	}
	
	if(s == "SWORD"){
		itm.desc = "GIVES A FLAT DMG BONUS";
		itm.typ = Item.wep;
		itm.bonus = 1;
		itm.cost = 80;
	}
	
	if(s == "STAFF"){
		itm.desc = "GIVES A FLAT MAG BONUS";
		itm.typ = Item.wep;
		itm.bonus = 1;
		itm.cost = 90;
	}
	
	if(s == "PLATE"){
		itm.desc = "GIVES A FLAT DEF BONUS";
		itm.typ = Item.arm;
		itm.bonus = 1;
		itm.cost = 90;
	}
	
	if(s == "CLOAK"){
		itm.desc = "GIVES A FLAT EVD BONUS";
		itm.typ = Item.arm;
		itm.bonus = 1;
		itm.cost = 80;
	}
	
	
	return itm;
}