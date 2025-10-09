up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

accept_key = keyboard_check_pressed(vk_space);

// moving througy the menu 
position += down_key - up_key;
if position >= option_length {position = 0};
if position < 0  {position = option_length - 1};

//using options
if accept_key {
    switch(position){

    //starting
    case 0:
        room_goto_next();
        break;

    //settings
    case 1:
        break;

    //quit
    case 2:
        game_end();
        break;
    }
}