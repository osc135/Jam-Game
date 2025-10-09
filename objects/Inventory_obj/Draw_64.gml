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
        draw_sprite_ext(Inventory_Slot_spr, 0, xx, yy, 1, 1, 0, c_grey, 0.9);        
    }
    
    //Draw items
    var item_entry = inventory[i]
    if (is_struct(item_entry)){
        var item_data = variable_struct_get(global.item_list, item_entry.item_id);
        
        if (item_data != undefined){
             var spr = item_data.sprite;
        
            var spr_w = sprite_get_width(spr);
            var spr_h = sprite_get_height(spr);
            
            var scale_x = slotW / spr_w * 0.8;
            var scale_y = slotH / spr_h * 0.8;
            
            //center sprites
            var draw_x = xx + (slotW - spr_w) / 2;
            var draw_y = yy + (slotH - spr_h) / 2;
            
            if i == selected_slot{
                draw_sprite_ext(spr, 0, draw_x, draw_y, scale_x, scale_y, 0, c_white, 1);
                //stack amount
                if(item_entry.amount > 1){
                    draw_text_transformed(xx + (slotW/2) - 15, yy + slotH, string(item_entry.amount), 3,3,0);
                }
            } else{
                draw_sprite_ext(spr, 0, draw_x, draw_y, scale_x, scale_y, 0, c_grey, 0.9); 
            }
            
            
        }
       
    }
     
       
}

/*
// Get mouse position
var mx = window_mouse_get_x();
var my = window_mouse_get_y();

// Draw your custom cursor sprite
draw_sprite(Cursor_spr, 0, mx, my);