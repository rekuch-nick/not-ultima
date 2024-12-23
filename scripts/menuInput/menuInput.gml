function menuInput(){
	if(menu == noone){ return ""; }
	
	
	if(ww.yIn != 0){
		if(ww.yTapped || ww.icd < 1){
			ww.icd = ww.menuCurSpeed;
			cur += ww.yIn;
			if(cur < 0){ cur = array_length(menu) - 1; }
			if(cur >= array_length(menu)){ cur = 0; }
		
		}
	}
	
	
	
	
	
	if(ww.pressedOK){
		return menu[cur];
	}
	
	if(ww.pressedNO){
		return "NO";
	}
	
	
	return "";
}



function menuXSelect() {
	if(ww.xIn != 0 && menuRef != noone){
		if(ww.xTapped || ww.icd < 1){			
			var ii = cur;
			for(var i=0; i<array_length(menuRef); i++){
				if(i == ii){ continue; }
				if(menuRef[i].y == menuRef[ii].y){
					cur = i;
					ww.icd = ww.menuCurSpeed;
					return;
				}
			}
		}
	}
}