var o = instance_find(objScreenPause, 0);
if(o != noone){
	if(o.state != State.mapSkillChooseDirection
			&& o.state != State.mapItemTarget
			){ return; }
	draw_self();
	
	var txt = "CHOOSE A DIRECTION";
	var a = 64 * 5.5;
	var b = pc.y > room_height / 2 ? 100 : room_height - 100;
	
	var w = string_width(txt) / 2 + 4;
	var h = string_height(txt);
	draw_rectangle_color(a-w, b, a+w, b+h, c_black, c_black, c_black, c_black, false);
	draw_set_halign(fa_center);
	draw_text_color(a, b, txt, c_white, c_white, c_white, c_white, image_alpha);
	draw_set_halign(fa_left);
	
}