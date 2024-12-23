function drawUnitStats(c, aa, bb){
	
	var cc = c_olive;
	with(objScreenBattle){
		if(c == active){
			cc = c_yellow;
		}
	}
	
	//draw_rectangle(aa, bb, aa + (64 * 4) - 8, bb + 124, true);
	draw_sprite_stretched(imgStatsBG, 0, aa, bb, 248, 124);
	draw_text_color(aa + 4, bb + 4, c.nam, cc, cc, cc, cc, 1);
	
	var w = 234 * (c.hp / c.hpMax);
	draw_sprite_stretched(imgHPBar, 0, aa + 8, bb + 4 + 20, w, 18);
	draw_text(aa + 8, bb + 4 + 20, c.hp);
	
	if(c.mpMax > 0){
		w = 234 * (c.mp / c.mpMax);
		draw_sprite_stretched(imgMPBar, 0, aa + 8, bb + 4 + 40, w, 18);
		draw_text(aa + 8, bb + 4 + 40, c.mp);
	}
	

}