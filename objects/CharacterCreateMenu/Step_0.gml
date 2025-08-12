// Get input
var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
var _down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
var _select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);

// Move cursor
if (_up) {
    position--;
    if (position < 0) position = options_length - 1;
}

if (_down) {
    position++;
    if (position >= options_length) position = 0;
}

// Select option
if (_select) {
    switch(position) {
        case 0: // New Character
            room_goto(Room1); // Go to game room
            break;
            
        case 1: // Load Character
            // TODO: Implement load functionality
            break;
            
        case 2: // Back
            room_goto(Title_Menu_Room); // Go back to title menu
            break;
    }
}