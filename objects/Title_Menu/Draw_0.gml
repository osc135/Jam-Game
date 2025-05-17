//Drawing meu background
//Changing alpha to be less than 1 makes it more transparent 
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//drawing menu screen options 
draw_set_font(global.font_main);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < options_length; i++)
{
	var _c = c_white;
	if position == i {_c = c_gray};
	//Y looks like that so that the options arent written stacked on top of eachother 
	draw_text_color(x + op_border, y + op_border + op_space * i , options[i], _c, _c, _c, _c, 1);
}