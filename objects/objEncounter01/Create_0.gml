event_inherited();


runDiff = 40; // lower is harder
runImpossible = false;
mobs = noone;

if(choose(true, false)){
	var n = irandom_range(1, 8);
	for(var i=0; i<n; i++){
		mobs[i] = objMobGoblin;
	}
} else {
	var n = irandom_range(1, 8);
	for(var i=0; i<n; i++){
		mobs[i] = objMobSkelly;
	}
}