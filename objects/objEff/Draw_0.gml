if(bgSquare){
	var c = choose(true, false) ? c_yellow : c_black;
	var w = sprite_width / 2;
	var h = sprite_height / 2;
	draw_rectangle_color(x-w, y-h, x+w, y+h, c, c, c, c, false);
}

draw_self();
if(txt != ""){
	var w = string_width(txt) / 2 + 4;
	var h = string_height(txt);
	draw_rectangle_color(x-w, y, x+w, y+h, c_black, c_black, c_black, c_black, false);
	draw_set_halign(fa_center);
	draw_text_color(x, y, txt, txtCol, txtCol, txtCol, txtCol, image_alpha);
	draw_set_halign(fa_left);
}