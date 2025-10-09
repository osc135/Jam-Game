#macro CHEST_SLOTS 16

// Chest inventory
inventory = array_create(CHEST_SLOTS, -1);
is_open = false;
row_length = 8;

// Slot size & padding
slotH = sprite_get_height(Inventory_Slot_spr);
slotW = sprite_get_width(Inventory_Slot_spr);
padX = 2;
padY = 2;

// Chest GUI panel size
cols = min(CHEST_SLOTS, row_length);
rows = ceil(CHEST_SLOTS / row_length);
invH = rows * (slotH + padY);
invW = cols * (slotW + padX);

invX = (display_get_gui_width() - invW) div 2
invY = display_get_gui_height() - invH - 500;

// Positions
chestX = (display_get_gui_width() - invW) div 2;
chestY = (display_get_gui_height() - invH - 200);   // chest panel higher on screen
playerX = (display_get_gui_width() - invW) div 2;
playerY = display_get_gui_height() - invH - 100;    // player inventory lower