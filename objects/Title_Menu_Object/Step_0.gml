up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

accept_key = keyboard_check_pressed(vk_space);

//number of options storage
option_length = array_length(option[menu_level]);

// moving througy the menu 
position += down_key - up_key;
if position >= option_length {position = 0};
if position < 0  {position = option_length - 1};

//using options
if accept_key {
	
	var _sml = menu_level;
	switch(menu_level){
		
		//main menu
		case 0:
		    switch(position){
		    //starting
		    case 0:
		        room_goto_next();
		        break;

		    //settings
		    case 1:
				menu_level = 1;
		        break;

		    //quit
		    case 2:
		        game_end();
		        break;
		    }
		break;
		
		//settings menu
		case 1:	
			switch(position){
				//window size 
				case 0:
				
					break;
				
				//brightness
				case 1:
				
					break;
				
				//controls
				case 2:
				
					break;
				
				//back 
				case 3:
					menu_level = 0;
					break;
				
		}
	break;
	}
		
	//set position back	
	if _sml !=	menu_level{position = 0};
	
	//correct option length
	option_length = array_length(option[menu_level]);
}
