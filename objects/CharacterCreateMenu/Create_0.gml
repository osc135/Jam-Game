// Character Creation Menu
// Menu options
options[0] = "New Character";
options[1] = "Load Character";
options[2] = "Back";

// Menu variables
position = 0;
options_length = array_length(options);

// Menu styling
op_border = 8;
op_space = 16;

// Make sure font is available
if (!variable_global_exists("font_main")) {
    gpu_set_texfilter(false);
    global.font_main = font_add_sprite(font_spr, ord(" ")-1, true, 1);
}