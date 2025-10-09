// 1-8 inv scrolling
for (var i = 1; i <= min(INVENTORY_SLOTS, row_length); i++){
    if (keyboard_check_pressed(ord(string(i)))){
        selected_slot = i-1;

    }
}

//Mouse Scrolling
var wheel = mouse_wheel_up() - mouse_wheel_down();
if (wheel != 0){
    selected_slot -= wheel;
    
    //Wrap
    if (selected_slot < 0){
        selected_slot = row_length - 1;
    } else if(selected_slot >= row_length){
        selected_slot = 0;
    }
}

//Drop Item with G
if (keyboard_check_pressed(ord("G"))){
    var item_entry = inventory[selected_slot];
    
    //check for item
    if (is_struct(item_entry)){
        var player = instance_find(StartPlayer_obj, 0);
        if player != noone{
            var drop_x = player.x + random_range(12,20);
            var drop_y = player.y;
            
            //decide how many to drop
            var drop_amount = keyboard_check(vk_shift) ? item_entry.amount : 1;
            
            //Decide what to drop
            var drop_obj;
            switch (item_entry.item_id){
                case "pickaxe":
                    drop_obj = Dropped_Pickaxe_obj;
                    break;
                case "axe":
                    drop_obj = Dropped_Axe_obj;
                    break
                default:
                    drop_obj = Dropped_Item_obj;
                    break;
            }
            
            //create dropped item
            var dropped = instance_create_depth(drop_x, drop_y, -100, drop_obj);
            if dropped != noone{
                dropped.item_id = item_entry.item_id;
                dropped.amount = drop_amount;
            }
            
            if (drop_amount >= item_entry.amount){
                inventory[selected_slot] = noone;
            } else{
                item_entry.amount -= drop_amount;
                inventory[selected_slot] = item_entry;
            }
            
            //unequip items
            if (player.heldItem != noone){
                if (item_entry.item_id == "pickaxe"){
                    instance_destroy(player.heldItem);
                    player.heldItem = noone;
                }else if (item_entry.item_id == "axe"){
                    instance_destroy(player.heldItem);
                    player.heldItem = noone;
                }
            }
             
        }
    }
}