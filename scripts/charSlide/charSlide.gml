function charSlide(){
	
	var xx = xSpot * 64 + 32;
	var yy = ySpot * 64 + 32;
	
	if(x < xx){ x += moveSpeed; face = 1; }
	if(x > xx){ x -= moveSpeed; face = -1; }
	if(y < yy){ y += moveSpeed; }
	if(y > yy){ y -= moveSpeed; }
	
	if(abs(xx - x) < moveSpeed){ x = xx; }
	if(abs(yy - y) < moveSpeed){ y = yy; }
	
}