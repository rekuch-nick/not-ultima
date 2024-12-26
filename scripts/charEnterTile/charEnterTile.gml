function charEnterTile(){
	if(id == pc){ playerEnterTile(); } else {
		//mob only
		with(objPupGuide){
			if(xSpot == other.xSpot && ySpot == other.ySpot){
				instance_destroy();
			}
		}
		
	}
	
	enterTrigger = false;
}