if(ww.state != State.battle){ return; }
if(hp < 1 && aly == 1){ 
	draw_sprite_stretched(imgBatPlayerGrave, 0, x - 64, y - 64, 128, 128);
	return; 
}
if(hp < 1 && aly == -1){
	return;
}

draw_self();