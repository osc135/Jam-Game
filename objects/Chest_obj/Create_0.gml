/// Chest_obj: Create Event

// Chest settings
slots = 16; // 8 per row, 2 rows total
cols = 8;
rows = ceil(slots / cols);

// Create the chest inventory array
inventory = array_create(slots, noone);

// GUI slot sizes
slotW = sprite_get_width(Inventory_Slot_spr);
slotH = sprite_get_height(Inventory_Slot_spr);
padX = 1;
padY = 1;

// Dimensions for drawing
chestW = cols * (slotW + padX);
chestH = rows * (slotH + padY);

// Center on screen when open
chestX = (display_get_gui_width() - chestW) div 2;
chestY = (display_get_gui_height() - chestH) div 2;

// Open state
is_open = false;

