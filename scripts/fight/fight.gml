function fight(c1, c2){
	
	var dam = 5;
	c2.hp -= dam;
	
	instance_create_depth(c2.x, c2.y - 32, ww.layerEff, effTxt, { txt: dam, });
	
	ds_list_add(battleMessage, c1.nam + " HITS " + c2.nam);
	displayTime = displayTimeMax;
	
	
	if(c2.hp < 1){
		ds_list_add(battleMessage, c2.nam + " IS DOWN");
		if(c2.aly != 1){
			instance_destroy(c2);
		}
	}
	
}