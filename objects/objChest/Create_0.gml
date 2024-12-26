event_inherited();

var r = irandom_range(1, 2); ///
if(r == 1){
	item = getItem("TORCH");
	val = 5;
} else if(r == 2){
	item = getItem("KEY");
	val = 2;
} else {
	item = noone;
	val = 1;
}

