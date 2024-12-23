if(ww.state != State.play){ return; }


inPlace = x == xSpot * 64 + 32 && y == ySpot * 64 + 32;
if(!inPlace){
	charSlide();
} else if(enterTrigger){ 
	charEnterTile(); 
}