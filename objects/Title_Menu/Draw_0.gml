//drawing menu screen options 
draw_set_font(global.font_main);

//calculating width and height of menu

var _new_width = 0;
for(var i = 0; i < options_length; i ++){
	var _op_width = string_width(options[menu_level, i]);
	_new_width = max(_new_width, _op_width);
}
width = _new_width + op_border*2;

height = op_border*2 + string_height(options[0,0]) + (options_length - 1) * op_space;

//center the menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/ 2 - width /2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/ 2 - height /2;

//height = op_border*2 + sprite_get_height(font_spr) + (options_length-1)*op_space;

//Drawing meu background
//Changing alpha to be less than 1 makes it more transparent 
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);



draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < options_length; i++)
{
	var _c = c_white;
	if position == i {_c = c_gray};
	//Y looks like that so that the options arent written stacked on top of eachother 
	draw_text_color(x + op_border, y + op_border + op_space * i , options[menu_level, i], _c, _c, _c, _c, 1);
}