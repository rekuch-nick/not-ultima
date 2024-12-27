event_inherited();

var r = irandom_range(1, 6); ///
val = 1;

if(r == 1){
	item = getItem("TORCH");
	val = 5;
} else if(r == 2){
	item = getItem("KEY");
	val = 2;
} else if(r == 3){
	item = getItem("SWORD");
} else if(r == 4){
	item = getItem("STAFF");
} else if(r == 5){
	item = getItem("PLATE");
} else if(r == 6){
	item = getItem("CLOAK");
} else {
	item = noone;
}

