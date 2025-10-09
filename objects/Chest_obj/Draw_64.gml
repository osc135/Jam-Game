// -------------------------
// Chest Draw GUI Event
// -------------------------

// Only draw if chest is open
if (!self.is_open) exit;

// Get player inventory instance
var inv = instance_find(Inventory_obj, 0);
if (inv == noone) exit;

// Slot dimensions & padding
var slotW = sprite_get_width(Inventory_Slot_spr);
var slotH = sprite_get_height(Inventory_Slot_spr);
var padX = 2;
var padY = 2;

// -------------------------
// Draw CHEST slots and items
// -------------------------
for (var i = 0; i < CHEST_SLOTS; i++) {
    var col = i mod self.row_length;
    var row = i div self.row_length;
    var xx = self.invX + col * (slotW + padX);
    var yy = self.invY + row * (slotH + padY);

    // Draw slot background
    draw_sprite_ext(Inventory_Slot_spr, 0, xx, yy, 1, 1, 0, c_white, 0.8);

    // Draw item if valid
    var slot = self.inventory[i];
    if (slot != -1 && slot != noone && is_struct(slot)) {
        var item_data = variable_struct_get(global.item_list, slot.item_id);
        if (item_data != undefined) {
            var spr = item_data.sprite;

            // Scale to fit slot
            var spr_w = sprite_get_width(spr);
            var spr_h = sprite_get_height(spr);
            var scale_x = slotW / spr_w * 0.8;
            var scale_y = slotH / spr_h * 0.8;

            // Center sprite in slot
            var draw_x = xx + (slotW - spr_w * scale_x) / 2;
            var draw_y = yy + (slotH - spr_h * scale_y) / 2;

            draw_sprite_ext(spr, 0, draw_x, draw_y, scale_x, scale_y, 0, c_white, 1);

            // Draw stack amount if more than 1
            if (slot.amount > 1) {
                draw_set_font(GameFont); // Optional: use bigger font
                draw_set_color(c_white);
                draw_text(xx + slotW - 12, yy + slotH - 12, string(slot.amount));
            }
        }
    }
}

// -------------------------
// Draw custom cursor
// -------------------------
var mx = window_mouse_get_x();
var my = window_mouse_get_y();
draw_sprite(Cursor_spr, 0, mx, my);
