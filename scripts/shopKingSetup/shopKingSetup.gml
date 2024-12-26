function shopKingSetup(){
	
	
	
	npc = imgNPCKing;
	txt = "Seek your fortunes in the dungeon below. If you survive, bring me a tithe and I will grant you power";
	menu = ["OK"];
	menuRef = noone;
	cur = 0;
	
	var promoForSale = false;
	for(var i=0 ; i<4; i++){
		if(pc.party[i] == noone){ price[i] = 0; continue; }
		price[i] = pc.party[i].lvl * 100;
		if(pc.coins >= price[i]){ promoForSale = true; }
	}
	
	state = noone;
	if(!promoForSale){ return; }
	
	state = State.promoteChooseWho;
	menu = noone;
	txt = "Who will receive more power?";
	
	var ii = 0;
	for(var i=0; i<4; i++){
		if(price[i] > 0 && pc.coins >= price[i]){
			menu[ii] = pc.party[i].nam + " -$" + string(price[i]);
			menuRef[ii] = pc.party[i];
			price[ii] = price[i];
			ii ++;
		}
	}
	
	
}