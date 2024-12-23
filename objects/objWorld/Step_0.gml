input();

if(state == State.gen){ worldGen(); }

/*
if(state == State.play){
	if(encounter != noone){
		instance_destroy(encounter);
		encounter = noone;
	}
}