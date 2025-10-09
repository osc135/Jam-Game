#macro INVENTORY_SLOTS 8

row_length = 8;
inventory = array_create(INVENTORY_SLOTS, noone);
//for (var i=0; i < INVENTORY_SLOTS; i++){
//    inventory[i] = { id: noone, count: 0};
//}

selected_slot = 0;
selected_item = noone;

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

/*

function add_item(item_key){
    var item_data = global.item_list[item_key];
    
    if (item_data.stackable){
        for (var i = 0; i < INVENTORY_SLOTS; i++){
            if (inventory[i].id == item_key){
                if (inventory[i].count < item_data.max_stack){
                    inventory[i].count++;
                    return true;
                }
            }
        }
    }
    
    for (var i=0; i < INVENTORY_SLOTS; i++){
        if (inventory[i].id == noone){
            inventory[i].id = item_key;
            inventory[i].count = 1;
            return true;
        }
    }
    
    return false;
        
}
 */