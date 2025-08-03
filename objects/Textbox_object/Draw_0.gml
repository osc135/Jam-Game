accept_key = keyboard_checkpressed(vk_space);
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0] + 120);

if setup == false{
	
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
		
	page_number = array_length(text);
	for(var i = 0; i < page_number; i++){		
		//finds the amount of characters on each page and store it in text length
		text_length[i] = string_length(text[i]);
		
		//get the x pos for textbox
			//no character, it centers textbox
		text_x_offset[i] = 40;
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
		//destory textbox 
		else{
			instance_destory();
		}
		
	}
	//if text is npt done typing, it will fill out the page
	else{
		draw_char = text_length[page];
	}
	
}

//draw textbox 
