function getItem(s){
	var itm = {
		nam: s,
		stackable: false,
		stacks: 1,
		img: imgPupCoin,
		desc: "...",
		type: Item.consumable,
		spell: noone,
	}
	
	if(s == "TORCH"){
		itm.stackable = true;
		itm.desc = "USE TO MAKE LIGHT";
		itm.spell = Spell.light;
	}
	
	if(s == "KEY"){
		itm.stackable = true;
		itm.desc = "USE OPEN LOCKS";
		itm.spell = Spell.open;
	}
	
	if(s == "ROCK"){
		itm.stackable = false;
		itm.desc = "KINDA HEAVY";
		itm.type = Item.null;
	}
	
	
	return itm;
}