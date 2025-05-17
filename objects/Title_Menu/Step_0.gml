//gets input 
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

accept_key =keyboard_check_pressed(vk_space);

//moving through the menu 
position += down_key - up_key;

//loops the menu to the number of items never going out of bounds
if position >= options_length {position = 0};
if position < 0	{position = op_length - 1};
	
//using the options

if accept_key{
switch(position){
	
	//starting game
	case 0: 
	room_goto_next()
		break;
	
	//settings
	case 1: 

		break;
	//end the game 	
	case 2:
	game_end();
		break;
}
}