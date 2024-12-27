if(state == State.mapSkillChooseDirection){ return; }
if(state == State.mapItemTarget){ return; }
if(state == State.mapSkillWait){ return; }

draw_self();
menuDraw(menu, cur, 40, 40, false);


if(state == State.mapStats){
	draw_sprite_stretched(menuRef[cur].sprite_index, 0, 400, 70, 128, 128);
	drawStats(menuRef[cur]);
}

if(state == State.mapSkillChooseUser ||
		state == State.mapSkillChooseTarget || state == State.equipOnWhom ){
	if(cur < array_length(menuRef)){
		if(menuRef[cur] != noone){			
			draw_sprite_stretched(menuRef[cur].sprite_index, 0, 400, 70, 128, 128);
		}
	}
}

if(state == State.equipOnWhom){
	draw_text(250, 250, "CURRENT: ")
	draw_text(280, 280, itemName(menuRef[cur].wep));
	draw_text(250, 340, "CHANGE: ")
	draw_text(280, 370, equipChange(menuRef[cur].wep, itemToUse));
}

if(state == State.mapSkillChooseSkill ){
	draw_sprite_stretched(pc.party[lastUser].sprite_index, 0, 400, 70, 128, 128);
}



if(state == noone){
	for(var i=0; i<4; i++){
		var c = pc.party[i];
		if(c == noone){ continue; }
		var a = i == 0 || i == 2 ? 300 : 500;
		var b = i == 0 || i == 1 ? 70 : 270;
		var s = c.hp >= 1 ? c.sprite_index : imgBatPlayerGrave;
		
		draw_sprite_stretched(s, 0, a, b, 128, 128);
	}
}




if(txt != ""){
	draw_text_ext(48, 600, txt, 32, 680);
}