game_set_speed(30, gamespeed_fps);
draw_set_font(fntPlain);
W = 11;
H = 11;
icd = 0;
menuCurSpeed = 6;
input();
stage = 0;
depth = -1000;

layerFloor = -100;
layerBlock = -300;
layerPup = -500;
layerMob = -700;
layerScreen = -1001;
layerEff = -1190;

mobRowBack = 9 * 64 + 32;
mobRowFront = mobRowBack - 124;

state = State.title;
encounter = noone;

for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
	fmap[a, b] = imgTFloor;
	bmap[a, b] = noone;
	mmap[a, b] = noone;
	vmap[a, b] = 0;
}}

instance_create_depth(0, 0, layerScreen, objScreenTitle);