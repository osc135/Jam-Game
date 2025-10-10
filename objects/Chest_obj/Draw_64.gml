// --- Chest GUI --- //
var player = instance_find(StartPlayer_obj, 0);
if (player == noone) exit;
if (!is_open) exit;

var inv = instance_find(Inventory_obj, 0);
if (inv == noone) exit;

// ===============================
// Layout configuration
// ===============================
var slotW = sprite_get_width(Inventory_Slot_spr);
var slotH = sprite_get_height(Inventory_Slot_spr);
var pad = 2;
var cols = 8;

var chest_rows = ceil(array_length(inventory) / cols);
var chestW = cols * (slotW + pad);
var chestH = chest_rows * (slotH + pad);

var chestX = (display_get_gui_width() - chestW) div 2;
var chestY = (display_get_gui_height() div 2) - slotH; // chest higher up

// Player inventory at bottom of screen
var playerInvY = display_get_gui_height() - slotH - 100; // 20 pixels above bottom

// ===============================
// Draw chest inventory
// ===============================
draw_set_color(c_white);


for (var i = 0; i < array_length(inventory); i++) {
    var col = i mod cols;
    var row = i div cols;

    var xx = chestX + col * (slotW + pad);
    var yy = chestY + row * (slotH + pad);

    draw_sprite_ext(Inventory_Slot_spr, 0, xx, yy, 1, 1, 0, c_white, 1);

    var item_entry = inventory[i];
    if (is_struct(item_entry)) {
        var item_data = variable_struct_get(global.item_list, item_entry.item_id);
        if (item_data != undefined) {
            var spr = item_data.sprite;
            var scale = min((slotW * 0.8) / sprite_get_width(spr), (slotH * 0.8) / sprite_get_height(spr));
            draw_sprite_ext(spr, 0, xx + slotW / 2, yy + slotH / 2, scale, scale, 0, c_white, 1);

            if (item_entry.amount > 1) {
                draw_text(xx + slotW * 0.7, yy + slotH * 0.7, string(item_entry.amount));
            }
        }
    }

    // --- Transfer Chest → Inventory ---
    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx, yy, xx + slotW, yy + slotH)) {
        if (mouse_check_button_pressed(mb_left) && is_struct(inventory[i])) {
            var transfer_amount = keyboard_check(vk_shift) ? inventory[i].amount : 1;
            var item_to_transfer = inventory[i];

            var merged = false;
            for (var j = 0; j < array_length(inv.inventory); j++) {
                var target_slot = inv.inventory[j];
                if (is_struct(target_slot) && target_slot.item_id == item_to_transfer.item_id) {
                    target_slot.amount += transfer_amount;
                    inventory[i].amount -= transfer_amount;
                    if (inventory[i].amount <= 0) inventory[i] = noone;
                    merged = true;
                    break;
                }
            }

            if (!merged) {
                var empty_slot = array_index_of(inv.inventory, noone);
                if (empty_slot != -1) {
                    inv.inventory[empty_slot] = { item_id: item_to_transfer.item_id, amount: transfer_amount };
                    inventory[i].amount -= transfer_amount;
                    if (inventory[i].amount <= 0) inventory[i] = noone;
                }
            }
        }
    }
}

// ===============================
// Draw player inventory (bottom)
// ===============================
var playerInvX = (display_get_gui_width() - (cols * (slotW + pad))) div 2;


for (var i = 0; i < array_length(inv.inventory); i++) {
    var col = i mod cols;
    var row = i div cols;

    var xx = playerInvX + col * (slotW + pad);
    var yy = playerInvY + row * (slotH + pad);

    if (i == inv.selected_slot) {
        draw_sprite_ext(Selection_spr, 0, xx, yy, 1, 1, 0, c_white, 1);
    } else {
        draw_sprite_ext(Inventory_Slot_spr, 0, xx, yy, 1, 1, 0, c_white, 1);
    }

    var item_entry = inv.inventory[i];
    if (is_struct(item_entry)) {
        var item_data = variable_struct_get(global.item_list, item_entry.item_id);
        if (item_data != undefined) {
            var spr = item_data.sprite;
            var scale = min((slotW * 0.8) / sprite_get_width(spr), (slotH * 0.8) / sprite_get_height(spr));
            draw_sprite_ext(spr, 0, xx + slotW / 2, yy + slotH / 2, scale, scale, 0, c_white, 1);

            if (item_entry.amount > 1) {
                draw_text(xx + slotW * 0.7, yy + slotH * 0.7, string(item_entry.amount));
            }
        }
    }

    // --- Transfer Inventory → Chest ---
    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xx, yy, xx + slotW, yy + slotH)) {
        if (mouse_check_button_pressed(mb_left) && is_struct(inv.inventory[i])) {
            var transfer_amount = keyboard_check(vk_shift) ? inv.inventory[i].amount : 1;
            var item_to_transfer = inv.inventory[i];

            var merged = false;
            for (var j = 0; j < array_length(inventory); j++) {
                var target_slot = inventory[j];
                if (is_struct(target_slot) && target_slot.item_id == item_to_transfer.item_id) {
                    target_slot.amount += transfer_amount;
                    inv.inventory[i].amount -= transfer_amount;
                    if (inv.inventory[i].amount <= 0) inv.inventory[i] = noone;
                    merged = true;
                    break;
                }
            }

            if (!merged) {
                var empty_slot = array_index_of(inventory, noone);
                if (empty_slot != -1) {
                    inventory[empty_slot] = { item_id: item_to_transfer.item_id, amount: transfer_amount };
                    inv.inventory[i].amount -= transfer_amount;
                    if (inv.inventory[i].amount <= 0) inv.inventory[i] = noone;
                }
            }
        }
    }
}
