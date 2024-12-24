function fight(c1, c2){
	
	var damTotal = 0;
	var hitsHit = 0;
	var misses = 0;
	
	for(var i=0; i<c1.hits; i++){
		if(!roll(c2.evade)){
			var dam = irandom_range(c1.dmgMin, c1.dmgMax);
			dam = clamp(dam - c2.def, 1, dam);
			damTotal += dam;
			hitsHit ++;
		} else {
			misses ++;
		}
	}
	
	c2.hp -= damTotal;
	
	if(hitsHit == 0){
		instance_create_depth(c2.x, c2.y - 32, ww.layerEff, effTxt, { txt: "DODGE", });
		ds_list_add(battleMessage, c1.nam + " MISSESS " + c2.nam);
	} else if(hitsHit == 1){
		instance_create_depth(c2.x, c2.y - 32, ww.layerEff, effTxt, { txt: dam, });
		ds_list_add(battleMessage, c1.nam + " HITS " + c2.nam + " FOR " + string(damTotal));
	} else {
		instance_create_depth(c2.x, c2.y - 32, ww.layerEff, effTxt, { txt: dam, });
		ds_list_add(battleMessage, c1.nam + " HITS " + c2.nam + " " + string(hitsHit) + " TIMES FOR " + string(damTotal));
	}
	
	
	displayTime = displayTimeMax;
	
	
	if(c2.hp < 1){
		ds_list_add(battleMessage, c2.nam + " IS DOWN");
		if(c2.aly != 1){
			instance_destroy(c2);
		}
	}
	
}