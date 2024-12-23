function input(){
	if(icd > 0){ icd --; }
	
	gamepadID = 0;
	for (var i = 0; i < gamepad_get_device_count(); i++;) {
		if gamepad_is_connected(i) {
			gamepadID = i;
		}
	}
	
	
	
	xIn = 0;
	if(keyboard_check(vk_left) || keyboard_check(ord("A")) ||
								gamepad_button_check(gamepadID, gp_padl) || 
								gamepad_axis_value(gamepadID, gp_axislh) < -.5 ){
		xIn --;
	}
	
	if(keyboard_check(vk_right) || keyboard_check(ord("D")) ||
								gamepad_button_check(gamepadID, gp_padr) || 
								gamepad_axis_value(gamepadID, gp_axislh) > .5 ){
		xIn ++;
	}
	xTapped = keyboard_check_pressed(vk_left) ||
				keyboard_check_pressed(vk_right) ||
				gamepad_button_check_pressed(gamepadID, gp_padl) || 
				gamepad_button_check_pressed(gamepadID, gp_padr);
	
	yIn = 0;
	if(keyboard_check(vk_down) || keyboard_check(ord("S")) ||
								gamepad_button_check(gamepadID, gp_padd) || 
								gamepad_axis_value(gamepadID, gp_axislv) > .5 ){
		yIn ++;
	}
	
	if(keyboard_check(vk_up) || keyboard_check(ord("W")) ||
								gamepad_button_check(gamepadID, gp_padu) || 
								gamepad_axis_value(gamepadID, gp_axislv) < -.5 ){
		yIn --;
	}
	yTapped = keyboard_check_pressed(vk_up) ||
				keyboard_check_pressed(vk_down) ||
				gamepad_button_check_pressed(gamepadID, gp_padu) || 
				gamepad_button_check_pressed(gamepadID, gp_padd);
	
	
	
	
	
	holdingOK = keyboard_check(vk_enter) || gamepad_button_check(gamepadID, gp_face1);
	pressedOK = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(gamepadID, gp_face1);
	//if(!holdingOK && !pressedOK){ releasedOK = true; }
	
	holdingNO = keyboard_check(vk_backspace) || gamepad_button_check(gamepadID, gp_face2) || keyboard_check(vk_escape);
	pressedNO = keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(gamepadID, gp_face2) || keyboard_check_pressed(vk_escape);
	
	holdingWait = keyboard_check(vk_space) || gamepad_button_check(gamepadID, gp_face3);
	pressedWait = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(gamepadID, gp_face3);
	
	
	

}