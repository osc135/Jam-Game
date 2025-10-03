#macro INVENTORY_SLOTS 8

row_length = 8;
inventory = array_create(0);
//for (var i=0; i < INVENTORY_SLOTS; i++){
//    inventory[i] = { id: noone, count: 0};
//}

selected_slot = 0;
selected_item = 0;

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