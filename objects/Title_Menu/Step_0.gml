//gets input 
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

accept_key =keyboard_check_pressed(vk_space);

//storing number of options in current menu

options_length = array_length(options[menu_level]);

//moving through the menu 
position += down_key - up_key;

//loops the menu to the number of items never going out of bounds
if position >= options_length {position = 0};
if position < 0	{position = op_length - 1};
	
//using the options

if accept_key{
	
	var _sml = menu_level;
	switch(menu_level){
		case 0: 
			switch(position){
		//starting game
				case 0: 
				room_goto_next()
				break;
			
		//settings
				case 1: 
				menu_level = 1;
				break;
		//end the game 	
				case 2:
				game_end();
				break;
		}
		break;
		
	//settings
		case 1 :
		switch(position){
			//window size 
			case 0:
				break;
			
			//brightness
			case 1:
				
				break;
			//control
			case 2:
				break;
			//back
			case 3:
				menu_level = 0;
				break;	
			
		}
	}
	//setting the positiob back
	if _sml != menu_level {position = 0};
	
	//correcting options length
	options_length = array_length(options[menu_level]);
}