scale();
ww.state = State.shop;
state = noone;

cur = 0;

forSale = noone;

if(forSale != noone){
	menu = ["BUY", "SELL"];
} else {
	menu = ["OK"];
}
menuRef = noone;

npc = imgNPC;
txt = "Welcome, stranger. Fine night for a curse! Horrible day to be lost in the dungeon though. Honestly, IDK anymore. The quick brown fox jumps over the lazy dog. The dog is so lazy!";

if(ww.stage == 0 && ww.fmap[pc.xSpot, pc.ySpot] != noone){
	if(ww.fmap[pc.xSpot, pc.ySpot].sprite_index == imgTGrassTemple){
		shopKingSetup();
	}
}

if(pc.guideTalk){
	shopGuideSetup();
}


