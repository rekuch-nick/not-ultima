



if(menu == noone){
	buildCharMenu();	
	if(cur >= array_length(menu)){ cur = 0; }
}


var action = menuInput();


if(action == "NO"){
	if(pIndex > 0){
		party[pIndex - 1] = noone;
		menu = noone;
		menuRef = noone;
		pIndex --;
	}
	
} else if(action == "READY"){
	ww.state = State.play;
	setParty(party[0], party[1], party[2], party[3])
	
	instance_destroy();
} else if(action != "") {
	party[pIndex] = menuRef[cur];
	pIndex ++;
	menu = noone;
	
	if(pIndex == 4){
		pc.sprite_index = party[0].smallSprite;
		menuRef = noone;
		menu = ["READY"];
		cur = 0;
	}
}
