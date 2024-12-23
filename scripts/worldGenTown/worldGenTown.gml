function worldGenTown(){
	inTown = true;
	
	with(objBattleChar){ if(aly == 1){
		hp = hpMax;
		mp = mpMax;
		poisonTime = 0;
		sunderTime = 0;
		disarmTime = 0;
	}}
	
	stage = 0;
	mmap[pc.xSpot, pc.ySpot] = noone;
	pc.xSpot = 8;
	pc.ySpot = 9;
	pc.x = pc.xSpot * 64 + 32;
	pc.y = pc.ySpot * 64 + 32;
	mmap[pc.xSpot, pc.ySpot] = pc;
	pc.enterTrigger = false;
	
	
	for(var a=0; a<W; a++){ for(var b=0; b<H; b++){
		fmap[a, b] = imgTGrass;
		bmap[a, b] = noone;
		mmap[a, b] = noone;
		vmap[a, b] = 0;
	}}
	
	
	for(var a=0; a<5; a++){ bmap[a, 0] = imgTHouses; }
	for(var a=1; a<7; a++){ bmap[a, 1] = imgTHouses; }
	
	for(var b=0; b<5; b++){ bmap[0, b] = imgTHouses; }
	for(var b=0; b<4; b++){ bmap[2, b] = imgTHouses; }
	for(var b=0; b<4; b++){ bmap[4, b] = imgTHouses; }
	
	bmap[6, 2] = imgTHouses;
	bmap[6, 1] = imgTHouses2;
	bmap[0, 1] = imgTHouses2;
	bmap[2, 0] = imgTHouses2;
	
	
	for(var b=0; b<9; b++){ bmap[9, b] = imgTTrees; }
	bmap[8, 7] = imgTTrees;
	bmap[10, 8] = imgTTrees;
	bmap[6, 0] = imgTTrees;
	bmap[7, 0] = imgTTrees;
	bmap[8, 1] = imgTTrees;
	bmap[10, 4] = imgTTrees;
	bmap[10, 0] = imgTTrees;
	
	bmap[8, 0] = imgTTree;
	
	for(var b=0; b<11; b++){ fmap[10, b] = imgTDirt; }
	fmap[9, 1] = imgTDirt;
	fmap[9, 2] = imgTDirt;
	fmap[9, 9] = imgTDirt;
	fmap[10, 9] = imgTDirt;
	fmap[9, 10] = imgTDirt;
	fmap[10, 10] = imgTDirt;
	instance_create_depth(10 * 64, 10 * 64, layerPup, objPupStairs);
	
	
	bmap[1, 2] = imgTInn;
	bmap[3, 2] = imgTShop;
	bmap[5, 2] = imgTTemple;
	
	//bmap[2, 6] = imgTHouses3;
	//bmap[3, 7] = imgTHouses3;
	
	fmap[6, 7] = imgTGrassFlower;
	fmap[3, 8] = imgTGrassFlower;
	fmap[7, 4] = imgTGrassFlower;
	
	for(var a=0; a<5; a++){ bmap[a, 10] = imgTWater; }
	for(var a=0; a<3; a++){ bmap[a, 9] = imgTWater; }
	
	
	pc.gotoTown = false;
	
}