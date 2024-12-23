function playerInit(){
	
	
	
	
	batFighter = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerFighter);
	batBarb = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerBarbarian);
	batRog = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerRogue);
	batPal = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerPalidin);
	batRng = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerRanger);
	batBard = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerBard);
	batAlch = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerChemist);
	batSorc = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerSorcerer);
	batWiz = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerWizard);
	batClr = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerCleric);
	batDruid = instance_create_depth(-96, 0, ww.layerScreen - 1, objPlayerDruid);
	
	
}