function drawStats(c){
	
	
	draw_text(250, 220, "LVL " + string(c.lvl));
	
	draw_text(250, 250, "DMG " + string(c.dmgMin) + "-" + string(c.dmgMax));
	draw_text(250, 280, "DEF " + string(c.def));
	if(c.evade > -1){
		draw_text(250, 310, "EVD% " + string(c.evade));
	}
	if(c.runBonus > 0){
		draw_text(250, 340, "+RUN% " + string(c.runBonus));
	}
	if(c.quickChance > 0){
		draw_text(250, 370, "FIRST% " + string(c.quickChance));
	}
}