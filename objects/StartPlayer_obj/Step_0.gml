right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

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
    var swing = instance_create_layer(x, y, "Instances", Swining_Pickaxe);
swing.image_xscale = image_xscale;
}

//Animate
if xspeed == 0 && yspeed == 0 {
	image_index = 0;
}
