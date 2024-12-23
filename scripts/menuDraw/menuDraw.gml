function menuDraw(menu, cur, a, b, center){//, bgCol){
	
	//draw_text(10, 10, ww.icd)
	/*
	if(!is_undefined(bgCol)){
		
		var aa = string_width(menu);
		var bb = array_length(menu) * 32;
		
		draw_rectangle_color(a - 4, b - 4, a + aa + 8, b + bb + 8, c_white, c_white, c_white, c_white, false);
		draw_rectangle_color(a, b, a + aa + 4, b + bb + 4, bgCol, bgCol, bgCol, bgCol, false);
	}*/
	
	
	if(center){ draw_set_halign(fa_center); }
	
	for(var i=0; i<array_length(menu); i++){
		if(cur == i){ draw_set_color(c_yellow); }
		draw_text(a, b + i * 32, menu[i]);
		draw_set_color(c_white);
	}
	
	draw_set_halign(fa_left);
	
}