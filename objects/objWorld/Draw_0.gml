


for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
	if(vmap[a, b] > 0){
		draw_set_alpha(vmap[a, b]);
		draw_sprite_stretched(imgFog, 0, a * 64, b * 64, 64, 64);
	}
}}
draw_set_alpha(1);


//hud stats
for(var i=0; i<4; i++){
	if(pc.party[i] == noone){ continue; }
	var aa = 11 * 64 + 4;
	var bb = 4 + (i * 64 * 2);
	drawUnitStats(pc.party[i], aa, bb);
}

var s = "DEEP " + string(ww.stage);
draw_text(11 * 64 + 4, 520, s);
draw_text(11 * 64 + 4, 550, "$" + string(pc.coins));