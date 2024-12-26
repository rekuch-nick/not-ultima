scale();

ww.state = State.status;
menu = menuPopulatePause();
cur = 0;
menuRef = noone;
state = noone;

lastUser = 0;
txt = "";
caster = noone;
spell = noone;
lastSkillTarget = 0;
lastSkill = 0;
nextState = noone;
itemDir = 1;
lastItem = 0;
itemToUse = noone;

instance_create_depth(pc.xSpot * 64 + 32, pc.ySpot * 64 + 32, depth, objChooseDirection);

