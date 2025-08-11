// Initialize menu system
// Disable texture filtering for crisp pixel fonts
gpu_set_texfilter(false);
// Create font from sprite
global.font_main = font_add_sprite(font_spr, ord(" ")-1, true, 1);

// Menu options
options[0, 0] = "Start Game";
options[0, 1] = "Settings";  
options[0, 2] = "Quit";

// Settings submenu
options[1, 0] = "Window Size";
options[1, 1] = "Brightness";
options[1, 2] = "Controls";
options[1, 3] = "Back";

// Menu variables
menu_level = 0;
position = 0;
options_length = 3; // Will be updated in Step event

// Menu styling
op_border = 8;
op_space = 16;

// Default sprite dimensions (will be set properly if sprite exists)
menu_sprite_width = 64;
menu_sprite_height = 64;