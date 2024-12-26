function tileObjFromSprite(s){
	
	switch(s){
		case imgTBlock:
		case imgTBlock2:
			return objBlock;	
		
		case imgChest:
			return objChest;
		
		
	}
	
	
	return objTile;
}