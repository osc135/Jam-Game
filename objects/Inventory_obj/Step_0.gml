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
            
            //create dropped item
            var dropped = instance_create_depth(drop_x, drop_y, -100, Dropped_Item_obj);
            if dropped != noone{
                dropped.item_id = item_entry.item_id;
            }
            
            /*
            //Add [Shift] for full stack
            var drop_amount = keyboard_check(vk_shift) ? item_entry.amount : 1;
            
            for (var j = 0; j < drop_amount; j++){
                var stack_dropped = instance_create_depth(drop_x + random_range(-2,2), drop_y, -100, Dropped_Item_obj);
                if (stack_dropped != noone) stack_dropped.item_id = item_entry.item_id;
            }
            
            if (keyboard_check(vk_shift)){
                inventory[selected_slot] = noone;
            } else{
                item_entry.amount -= 1;
                if(item_entry.amount <= 0) inventory[selected_slot] = noone;
                else inventory[selected_slot] = item_entry;
            }
             */
            
            //decrease stack
            if (item_entry.amount > 1){
                item_entry.amount -= 1;
                inventory[selected_slot] = item_entry;
            }else{
                inventory[selected_slot] = noone;
            }
             
        }
    }
}