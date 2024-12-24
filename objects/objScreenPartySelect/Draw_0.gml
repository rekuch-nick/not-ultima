


draw_self();
menuDraw(menu, cur, 60, 60, false);

draw_text(20, 20, "Who shall venture forth?");

if(menuRef != noone){
	draw_text_ext(20, 550, classDescription(menuRef[cur].class), 32, 900);
}


for(var i=0; i<4; i++){
	var a = i == 0 || i == 2 ? 450 : 650;
	var b = i == 0 || i == 1 ? 150 : 350;
	
	if(party[i] != noone){
		draw_sprite_stretched(party[i].sprite_index, 0, a, b, 128, 128);
		draw_text(a, b + 140, "Lvl " + string(party[i].lvl))
	}
}

