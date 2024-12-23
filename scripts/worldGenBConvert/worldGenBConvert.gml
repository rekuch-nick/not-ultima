function worldGenBConvert(o1, o2, n){
	
	var tries = 100 * n;
	while(tries > 0 && n > 0){
		tries --;
		a = irandom_range(0, W - 1);
		b = irandom_range(0, H - 1);
		
		if(bmap[a, b] == o1){
			bmap[a, b] = o2;
			n --;
		}
	}
}