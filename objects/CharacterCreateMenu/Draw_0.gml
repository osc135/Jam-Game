// Draw menu options
draw_set_font(global.font_main);

// Scale up the menu for better visibility (same as Title Menu)
var menu_scale = 6;

// Calculate menu dimensions
var _new_width = 0;
for(var i = 0; i < options_length; i++){
    var _op_width = string_width(options[i]);
    _new_width = max(_new_width, _op_width);
}
width = (_new_width + op_border*1.5) * menu_scale;
height = (op_border*1.5 + string_height(options[0]) + (options_length - 1) * op_space) * menu_scale;

// Center the menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

// Draw the character menu background sprite centered at the menu position
var bg_x = x + width/2 - sprite_get_width(Character_Menu_Create_Spr)*6/2;
var bg_y = y + height/2 - sprite_get_height(Character_Menu_Create_Spr)*6/2;
draw_sprite_ext(Character_Menu_Create_Spr, 0, bg_x, bg_y, 6, 6, 0, c_white, 1);

// Draw menu background box
draw_sprite_stretched(Menu_screen, 0, x, y, width, height);

// Draw options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < options_length; i++){
    var _c = c_white;
    if (position == i) {_c = c_yellow;}
    
    draw_text_transformed_color(
        x + op_border * menu_scale * 0.75, 
        y + op_border * menu_scale * 0.75 + op_space * menu_scale * i + 1,
        options[i], menu_scale, menu_scale, 0, 
        _c, _c, _c, _c, 1
    );
}