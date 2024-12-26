


var action = menuInput();

if(state == State.promoteChooseWho){
	
	if(action != ""){
		if(action == "OK" || action == "NO"){
			ww.state = State.play;
			instance_destroy();
			return;
			
		} else {
			pc.coins -= menuRef[cur].lvl * 100;
			menuRef[cur].lvl ++;
			var s = instance_create_depth(64 * 5.5, room_height / 2, depth - 10, effLevelUp);
			s.sprite_index = menuRef[cur].sprite_index;
			s.image_xscale = 8;
			s.image_yscale = 8;
			s.txt = "LVL " + string(menuRef[cur].lvl) + "!";
			setPartyStats();
			shopKingSetup();
		}
	
	
	}
	
	
	return;
}

if(action != ""){
	if(action == "OK" || action == "NO"){
		ww.state = State.play;
		instance_destroy();
		return;
	}
	
	
}