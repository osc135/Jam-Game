// Check for collision with player at the handle area
if (instance_exists(StartPlayer_obj)) {
    var player = instance_nearest(x, y, StartPlayer_obj);
    
    if (player != noone) {
        // Check collision specifically with the handle area (bottom part of the hoe)
        var handle_x = x;
        var handle_y = y + 16; // Handle is at the bottom of the sprite
        var dist = point_distance(handle_x, handle_y, player.x, player.y);
        
        if (dist < pickup_distance) {
            // Try to add to inventory
            if (instance_exists(Inventory_Object)) {
                with (Inventory_Object) {
                    if (add_item_to_inventory(other.item_id)) {
                        // Successfully added to inventory
                        show_debug_message("Hoe picked up!");
                        instance_destroy(other);
                    } else {
                        // Inventory full
                        show_debug_message("Inventory full!");
                    }
                }
            }
        }
    }
}