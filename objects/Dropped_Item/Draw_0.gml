// Draw the inventory item sprite with bobbing effect, scaled down
var scale = 0.3; // Make it 30% of original size
draw_sprite_ext(Inventory_item, item_id, x, y + bob_offset, scale, scale, 0, c_white, 1);