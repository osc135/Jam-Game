//dynamically get width and height 
var _new_width = 0;
for(var i = 0; i < option_length; i ++){
	var op_width = string_width(option[menu_level, i]);
	_new_width = max(_new_width, op_width); 
	}
width = _new_width + op_border * 2;
height = op_border * 2 + string_height(option[0,0]) + (option_length -1) * op_space;

//centering menu 
//x = camera_get_view_border_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
//y = camera_get_view_border_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

//Drawing menu backlground
draw_sprite_ext(sprite_index,image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//Drawing options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < option_length; i ++)
    {
        var _color = c_white;
        // changing color if on the option
        if position == i {_color = c_yellow}
        
		draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _color, _color, _color, _color, 1);

	}