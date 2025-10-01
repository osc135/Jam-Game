// Drawing Panels

//sprite size
var slotH = sprite_get_height(Inventory_Slot_spr)
var slotW = sprite_get_width(Inventory_Slot_spr)
//padding between
var padX = 1;
var padY = 1;

// amount of columns and rows
var cols = min(INVENTORY_SLOTS, row_length);
var rows = ceil(INVENTORY_SLOTS / row_length);

// panel height & width
var invH = rows * (slotH + padY);
var invW = cols * (slotW + padX);

// flexible panel placement
var invX = (display_get_gui_width() - invW) div 2
var invY = display_get_gui_height() - invH - 100;


// Draw each slot
for (var i=0; i < INVENTORY_SLOTS; i++){
    var col = i % row_length;
    var row = i div row_length;
    
    var xx = invX + 2 + col * (slotW + padX);
    var yy = invY + 2 + row * (slotH + padY);
    
    
    //Draw slots & Slot overlay
    if (i == selected_slot){
        draw_sprite_ext(Selection_spr, 0, xx, yy, 1, 1, 0, c_white, 1);                
    }else{
        draw_sprite_ext(Inventory_Slot_spr, 0, xx, yy, 1, 1, 0, c_white, 0.8);        
    }
    
    var slot = inventory[i];
    //draw item
    if (slot.id != noone){
        var item_data = global.item_list[slot.id];
        
        if (i == selected_slot){
            draw_sprite(item_data.sprite, 0, xx, yy);
        }else{
            draw_sprite_ext(item_data.sprite, 0, xx, yy, 1, 1, 0, c_white, 0.8);
        }
        
        //draw stack count
        if (item_data.stackable && slot.count > 1){
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            draw_text(xx + slotW - 4, yy + slotH - 4, string(slot.count));
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
        
    }
        
}