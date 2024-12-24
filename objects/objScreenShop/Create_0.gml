scale();
ww.state = State.shop;

cur = 0;

forSale = noone;

if(forSale != noone){
	menu = ["BUY", "SELL"];
} else {
	menu = ["OK"];
}

npc = imgNPC;
txt = "Welcome, stranger. Fine night for a curse! Horrible day to be lost in the dungeon though. Honestly, IDK anymore. The quick brown fox jumps over the lazy dog. The dog is so lazy!";

if(ww.stage == 0 && ww.fmap[pc.xSpot, pc.ySpot] != noone){
	if(ww.fmap[pc.xSpot, pc.ySpot].sprite_index == imgTGrassTemple){
		npc = imgNPCKing;
		txt = "Seek your fortunes in the dungeon below. Should you survive, bring your tithe to me and I shall grant you power";
	}
	
}