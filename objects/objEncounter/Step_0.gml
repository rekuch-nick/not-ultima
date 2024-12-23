event_inherited();
if(ww.state != State.play){ return; }
if(!inPlace){ return; }

if(ww.encounter == id){
	var s = instance_create_depth(0, 0, ww.layerScreen, objScreenBattle);
	s.encounter = ww.encounter;
	ww.encounter = noone;
	//instance_destroy();
	return;
}


if(readyTime >= 100 && ww.encounter == noone && roll(50) ){
	
	
	
	
	var xx = xSpot;
	var yy = ySpot;
	var path = noone;
	
	xx = pc.xSpot;
	yy = pc.ySpot;
	
	
	
	var dis = disOrth(xx, yy, xSpot, ySpot);
	if(dis > 1){
		path = pathing(xSpot, ySpot, xx, yy);
	
		if(path != noone){
			xx = path.a;
			yy = path.b;
		}
	}
	
	if(dis <= 1 || path != noone){
		
		if(charCanEnter(xx, yy)){
			charMoveTo(xx, yy);
		}
		
	}
	readyTime -= 100;
	
}



