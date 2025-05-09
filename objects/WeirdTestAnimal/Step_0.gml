right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

//Calculating Direction
xspeed = (right_key - left_key) * move_speed;
yspeed = (down_key - up_key) * move_speed;


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
y+= yspeed;

//Animate
if xspeed == 0 && yspeed == 0 {
	image_index = 0;
}