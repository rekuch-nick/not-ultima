event_inherited();


aly = 1;
passNPC = true;

xSpot = 2;
ySpot = 8;


x = xSpot * 64 + 32;
y = ySpot * 64 + 32;
depth = ww.layerMob - ySpot;

playerInit();

guideTalk = false;
coins = 0;
gotoTown = true; //
lightTime = 0;

firstTown = false; //

setParty(batFighter, batPal, batDruid, batWiz);

for(var i=0; i<200; i++){
	gotFloorTreasure[i] = false;
	seenTip[i] = false;
}

playerGainItem(getItem("SWORD"));
playerGainItem(getItem("STAFF"));
playerGainItem(getItem("SWORD"));
playerGainItem(getItem("STAFF"));
playerGainItem(getItem("KEY"), 5);
playerGainItem(getItem("TORCH"), 5);
