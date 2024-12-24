event_inherited();
if(ww.state != State.play){ return; }

if(ww.pressedNO){
	instance_create_depth(0, 0, ww.layerScreen, objScreenPause);
	return;
}


if(!inPlace){ return; }
if(ww.encounter != noone){ return; }



if(ww.pressedWait){
	y -= 16;
	timePasses();
}

if(ww.xIn != 0 xor ww.yIn != 0){
	face = ww.xIn != 0 ? ww.xIn : face;
	xt = xSpot + ww.xIn;
	yt = ySpot + ww.yIn;
	
	if(charCanEnter(xt, yt)){
		charMoveTo(xt, yt);
	}
}


if(ww.pressedOK){
	with(objPupStairs){
		if(xSpot == pc.xSpot && ySpot == pc.ySpot){
			with(objEncounter){ instance_destroy(); }
			ww.state = State.gen;
			break;
		}
	}
	
	with(objPupStairsOut){
		if(xSpot == pc.xSpot && ySpot == pc.ySpot){
			with(objEncounter){ instance_destroy(); }
			ww.state = State.gen;
			pc.gotoTown = true;
			break;
		}
	}
}