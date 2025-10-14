//x and y coords
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 144;

if(setup == false)
{
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//going through pages	
	for(var i = 0; i < page_number; i++)
	{
		//gets the number of chars on each page & stores
		text_length[i] = string_length(text[i]);
		
		text_x_offset[i] = 0;
	}
}