// Get mouse position
var mx = window_mouse_get_x();
var my = window_mouse_get_y();

// Draw your custom cursor sprite
draw_sprite(Cursor_spr, 0, mx, my);