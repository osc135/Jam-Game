//textbox params 
//changes the size of the textbox
textbox_width = 200;
textbox_height = 64;

border = 10;

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

//changing char changes the typewriter effect
draw_char = 0;
text_speed = 1;

setup = false;