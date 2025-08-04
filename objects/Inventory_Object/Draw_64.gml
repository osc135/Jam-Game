// 1) Compute panel origin
var rowLength = 8;
var invX = 510;
var invH = 12 + (((INVENTORY_SLOTS-1) div rowLength)+1)*36;
var invY = display_get_gui_height() - invH - 100;

// 2) Draw each slot + its item (no stretched panel!)
for (var i = 0; i < INVENTORY_SLOTS; i++) {
    var col = i mod rowLength;
    var row = i div rowLength;
    var xx  = invX + 2 + col * 100;
    var yy  = invY + 2 + row * 72;

    // Draw the slot - dimmer for non-selected, normal for selected
    if (i == selected_slot) {
        // Selected slot - draw at full brightness
        draw_sprite(Inventory_Slot, 0, xx, yy);
    } else {
        // Non-selected slots - draw darker
        draw_sprite_ext(Inventory_Slot, 0, xx, yy, 1, 1, 0, c_gray, 0.8);
    }

    // Draw the item icon if present
    if (inventory[i] != -1) {
        if (i == selected_slot) {
            // Item in selected slot - full brightness
            draw_sprite(Inventory_item, inventory[i], xx, yy);
        } else {
            // Item in non-selected slot - darker
            draw_sprite_ext(Inventory_item, inventory[i], xx, yy, 1, 1, 0, c_gray, 0.8);
        }
    }
}