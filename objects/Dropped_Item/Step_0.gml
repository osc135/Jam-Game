// Bobbing animation
bob_offset = sin(current_time * 0.005) * bob_amount;

// Check for player collision to pick up - must be on top of item
var player = instance_nearest(x, y, StartPlayer_obj);
if (player != noone) {
    if (point_distance(x, y, player.x, player.y) < 8) { // Very close - essentially on top
        // Find the inventory object
        var inv = instance_find(Inventory_Object, 0);
        if (inv != noone) {
            // Find an empty slot
            for (var i = 0; i < INVENTORY_SLOTS; i++) {
                if (inv.inventory[i] == -1) {
                    // Add item to inventory
                    inv.inventory[i] = item_id;
                    // Destroy this pickup
                    instance_destroy();
                    break;
                }
            }
        }
    }
}