draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, col, image_alpha);

if(active != noone){
	//draw_sprite_stretched(imgBatActive, 0, active.x - active.sprite_width / 2,
	//active.y - active.sprite_height / 2, active.sprite_width, active.sprite_height);
	
	draw_rectangle(active.x - active.sprite_width / 2, active.y - active.sprite_height / 2, active.x + active.sprite_width / 2, active.y + active.sprite_height / 2, true);
}

if(state == State.choosingTargetAttack || 
				state == State.choosingTargetSkillAlly || state == State.choosingTargetItemFoe ||
				state == State.choosingTargetSkillFoe || state == State.choosingTargetItemAlly ){
	if(menu != noone && menuRef != noone){
		if(menuRef[cur] != noone){
		
			var cc = menuRef[cur];
			draw_rectangle(cc.x - cc.sprite_width / 2, cc.y - cc.sprite_height / 2, cc.x + cc.sprite_width / 2, cc.y + cc.sprite_height / 2, true);
		}
	}
}


var str = "";
if(ds_list_size(battleMessage) > 0){
	var str = ds_list_find_value(battleMessage, 0);
} else if(state == State.choosingSkill && menuRef != noone){
	var str = spellDesc(menuRef[cur]);
}
if(str != ""){
	draw_text_ext(12, 600, str, 32, 680);
}