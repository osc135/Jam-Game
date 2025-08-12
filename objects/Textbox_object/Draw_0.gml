accept_key = keyboard_check_pressed(vk_space);
// Center the textbox horizontally and position above inventory
textbox_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - textbox_width/2;
textbox_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - textbox_height - 50;

if setup == false{
	
	setup = true;
	
	// Make sure font exists (same as menu system)
	if (!variable_global_exists("font_main")) {
		gpu_set_texfilter(false);
		global.font_main = font_add_sprite(font_spr, ord(" ")-1, true, 1);
	}
	
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
		
	page_number = array_length(text);
	for(var i = 0; i < page_number; i++){		
		//finds the amount of characters on each page and store it in text length
		text_length[i] = string_length(text[i]);
		
		// Calculate textbox width based on text length (with scaling factor)
		var text_width = string_width(text[i]) * 0.6; // 0.6 is our text scale
		textbox_width = max(60, text_width + border * 2 + 10); // min width 60, padding for borders
		
		//center the text within the textbox
		text_x_offset[i] = textbox_width/2;
	}
}

//typing text
if draw_char < text_length[page]{
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

//allows pages to be flipped through
if accept_key{
	//if typing is done go to next page
	if draw_char == text_length[page]{
		//next page
		if page < page_number - 1{
			page++;
			draw_char = 0;
		}
		//destroy textbox 
		else{
			instance_destroy();
		}
		
	}
	//if text is npt done typing, it will fill out the page
	else{
		draw_char = text_length[page];
	}
	
}

//draw textbox 
draw_sprite_stretched(txbx_sprite, txbx_image, textbox_x, textbox_y, textbox_width, textbox_height);

//draw text (smaller scale for dialogue)
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext_transformed(textbox_x + text_x_offset[page], textbox_y + border, _drawtext, line_seperation, line_width, 0.6, 0.6, 0);
