function charBumpTowards(a, b){
	if(xSpot < a){ x += 32; }
	if(xSpot > a){ x -= 32; }
	
	if(ySpot < b){ y += 32; }
	if(ySpot > b){ y -= 32; }
}