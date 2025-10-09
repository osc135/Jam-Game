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
        
		draw_text_color(x + op_border, y + op_border + op_space * i, option[i], _color, _color, _color, _color, 1);

	}