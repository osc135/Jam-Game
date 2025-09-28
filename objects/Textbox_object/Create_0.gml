//textbox params 
//changes the size of the textbox - will be set dynamically based on text
textbox_width = 160; // default, will be adjusted
textbox_height = 22;

border = 4;

line_seperation = 10;
line_width = textbox_width - border * 2;

txbx_sprite = Menu_screen;
txbx_image = 0;
txbx_image_speed = 0;

//Text
//the page of dialouge we are on
page = 0;
page_number = 0;

text[0] = "";

text_length[0] = string_length(text[0]);
text_x_offset[0] = 0;

//changing char changes the typewriter effect
draw_char = 0;
text_speed = 1;

setup = false;