/// Open/close chest
var player = instance_nearest(x, y, StartPlayer_obj);
if (player != noone && point_distance(x, y, player.x, player.y) < 16) {
    if (keyboard_check_pressed(ord("E"))) {
        is_open = !is_open;
    }
}

// Exit if chest is not open
if (!is_open) exit;

// Get player inventory
var inv = instance_find(Inventory_obj, 0);
if (inv == noone) exit;

// GUI mouse position
var mx = window_mouse_get_x();
var my = window_mouse_get_y();

// Slot dimensions (matches your Draw GUI)
var slotW = sprite_get_width(Inventory_Slot_spr);
var slotH = sprite_get_height(Inventory_Slot_spr);
var padX = 2;
var padY = 2;

// Chest slots
var chestX = invX;
var chestY = invY;

// Player inventory (drawn above chest or somewhere else)
var playerX = (display_get_gui_width() - invW)/2;
var playerY = display_get_gui_height() - invH - 100;

// Chest → Player
for (var i = 0; i < CHEST_SLOTS; i++) {
    var col = i mod row_length;
    var row = i div row_length;
    var xx = chestX + col * (slotW + padX);
    var yy = chestY + row * (slotH + padY);

    if (point_in_rectangle(mx, my, xx, yy, xx + slotW, yy + slotH)) {
        if (mouse_check_button_pressed(mb_left) && inventory[i] != -1) {
            var item_entry = inventory[i];

            if (keyboard_check(vk_shift)) {
                move_item_stack(item_entry, inv);
                inventory[i] = -1;
            } else {
                move_item_one(item_entry, inv);
                item_entry.amount -= 1;
                if (item_entry.amount <= 0) inventory[i] = -1;
                else inventory[i] = item_entry;
            }
        }
    }
}

// Player → Chest
for (var i = 0; i < INVENTORY_SLOTS; i++) {
    var player_slot = inv.inventory[i];
    if (player_slot == -1) continue;

    var col = i mod inv.row_length;
    var row = i div inv.row_length;
    var xx = playerX + col * (slotW + padX);
    var yy = playerY + row * (slotH + padY);

    if (point_in_rectangle(mx, my, xx, yy, xx + slotW, yy + slotH)) {
        if (mouse_check_button_pressed(mb_left)) {
            if (keyboard_check(vk_shift)) {
                move_item_stack_to_chest(player_slot, self);
                inv.inventory[i] = -1;
            } else {
                move_item_one_to_chest(player_slot, self);
                player_slot.amount -= 1;
                if (player_slot.amount <= 0) inv.inventory[i] = -1;
                else inv.inventory[i] = player_slot;
            }
        }
    }
}
