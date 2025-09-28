// Draw the inventory item sprite with bobbing effect, scaled down
var scale = 0.7; // Make it 10% of original size
draw_sprite_ext(sprite_index, image_index, x, y + bob_offset, scale, scale, 0, c_white, 1);