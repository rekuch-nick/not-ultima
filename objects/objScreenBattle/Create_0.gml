scale();

//colDir = 1;
//rr = 1;
//col = make_color_rgb(rr, 0, 0);
col = c_white;
ww.state = State.battle;

image_alpha = 0;


active = noone;
state = State.choosingAction;
menu = noone;
menuRef = noone;
casting = noone;
target = noone;
cur = 0;
displayTime = 0;
displayTimeMax = 20;
goldPot = 0;
battleMessage = ds_list_create();