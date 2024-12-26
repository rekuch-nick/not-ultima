


x += xSpeed;
y += ySpeed;
ySpeed += grav;


if(flicker){ image_alpha = random_range(0, 1); }
image_alpha -= fade;

image_angle += rot;
if(roll(rotChanceChance)){ rot *= -1; }

image_xscale += gro;
image_yscale += gro;

timeCD --;
if(timeCD < 1 || image_alpha < 0){
	instance_destroy();
}