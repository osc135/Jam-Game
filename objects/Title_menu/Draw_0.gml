//drawing the menu background
//to make it see-tjhrough, change alpha to be less than 1 (the last parameter)
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//drawing the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < options_length; i ++){
	//the y value changes so the options arent being placed on top of eachother
	draw_text(x + op_border, y + op_border + op_space * i, options[i]);
}
	
