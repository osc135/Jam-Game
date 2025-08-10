// Handle inventory cycling
//if (keyboard_check_pressed(ord("Q"))) {
    //selected_slot--;
    //if (selected_slot < 0) {
        //selected_slot = INVENTORY_SLOTS - 1;
   // }
//}

//if (keyboard_check_pressed(ord("E"))) {
  //  selected_slot++;
    //if (selected_slot >= INVENTORY_SLOTS) {
     //   selected_slot = 0;
  //  }
//}

// Alternative: Use number keys 1-8 for direct selection
for (var i = 1; i <= min(8, INVENTORY_SLOTS); i++) {
    if (keyboard_check_pressed(ord(string(i)))) {
        selected_slot = i - 1;
    }
}

// Mouse wheel scrolling
var wheel = mouse_wheel_up() - mouse_wheel_down();
if (wheel != 0) {
    selected_slot -= wheel;
    
    // Wrap around
    if (selected_slot < 0) {
        selected_slot = INVENTORY_SLOTS - 1;
    } else if (selected_slot >= INVENTORY_SLOTS) {
        selected_slot = 0;
    }
}

// Drop item with G key
if (keyboard_check_pressed(ord("G"))) {
    // Check if there's an item in the selected slot
    if (inventory[selected_slot] != -1) {
        // Get the player's position to drop the item nearby
        var player = instance_find(StartPlayer_obj, 0);
        if (player != noone) {
            // Drop item in the direction player is facing
            var drop_x = player.x;
            var drop_y = player.y;
            var drop_distance = 8;
            
            // Check player's sprite to determine facing direction
            if (player.sprite_index == PlayerRight_spr) {
                drop_x += drop_distance;
            } else if (player.sprite_index == PlayerLeft_spr) {
                drop_x -= drop_distance;
            } else if (player.sprite_index == PlayerUp_spr) {
                drop_y -= drop_distance;
            } else if (player.sprite_index == PlayerDown_spr) {
                drop_y += drop_distance;
            } else {
                // Default: drop to the right if no direction sprite
                drop_x += drop_distance;
            }
            
            // Create a dropped item in the facing direction
            var dropped = instance_create_depth(drop_x, drop_y, -100, Dropped_Item);
            if (dropped != noone) {
                // Set the dropped item to match what was in inventory
                dropped.item_id = inventory[selected_slot];
            }
        }
        
        // Remove item from inventory
        inventory[selected_slot] = -1;
    }
}