right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));



//Calculating Direction
xspeed = (right_key - left_key) * move_speed;
yspeed = (down_key - up_key) * move_speed;


// Set Sprite
mask_index = sprite[DOWN];
if yspeed == 0 {

	if xspeed > 0 {face = RIGHT};
	if xspeed < 0 {face = LEFT};
}

if xspeed > 0 && face == LEFT {face = RIGHT};
if xspeed < 0 && face == RIGHT {face = LEFT};

if xspeed == 0 {
	if yspeed > 0 {face = DOWN};
	if yspeed < 0 {face = UP};
}
if yspeed > 0 && face == UP {face = DOWN};
if yspeed < 0 && face == DOWN {face = UP};

sprite_index = sprite[face];

//Checking Collisions
if place_meeting(x + xspeed, y, wall_obj) == true
	{
	xspeed = 0
	}
if place_meeting(x, y + yspeed, wall_obj) == true
	{
	yspeed = 0
	}


x += xspeed;
y += yspeed;

//Checks if key pressed is Z for pickaxe
    if (keyboard_check_pressed(ord("Z"))) {
		var offsetX = 12;
		var offsetY = 0
		switch(face){
			case RIGHT:
				//offsetX = 12;
				offsetY = 2;
				break;
			case LEFT:
				offsetX = -12;
				//offsetY = 2;
				break;
			case UP:
				//offsetX = 12;
				offsetY = -2;
				break;
			case DOWN:
				//offsetX = 12;
				offsetY = 2;
				break; 
			
	}	
			
  //  var swing = instance_create_layer(x + offsetX, y + offsetY, "Instances", Swining_Pickaxe);
   // swing.image_xscale = image_xscale;
}


//Animate
if xspeed == 0 && yspeed == 0 {
	image_index = 0;
	
}
