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

    // Draw the slot (assumes its interior is transparent)
    draw_sprite(Inventory_Slot, 0, xx, yy);

    // Draw the item icon if present
    if (inventory[i] != -1) {
        draw_sprite(Inventory_item, inventory[i], xx, yy);
    }
}