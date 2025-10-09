//Bob animation
bob_offset = sin((current_time - spawn_time) * 0.005) * bob_height;


//Check collision to pick up
var player = instance_nearest(x, y, StartPlayer_obj);

if (player != noone){
    if (point_distance(x, y, player.x, player.y) < 8){
        // Find the inventory 
        var inv = instance_find(Inventory_obj, 0);
        if (inv != noone){
            var added = false;
            
            //check for existing stack
            for (var i=0; i < INVENTORY_SLOTS; i++) {
                var entry = inv.inventory[i];
                if (is_struct(entry) && entry.item_id == item_id){
                    entry.amount += amount;
                    inv.inventory[i] = entry;
                    added = true;
                    break
                }
            }
            
            //no stack found
            if (!added){
                for (var i=0; i <INVENTORY_SLOTS; i++){
                    if (inv.inventory[i] == -1 || inv.inventory[i] == noone){
                        inv.inventory[i] = {item_id:item_id, amount:amount};
                        added = true;
                        break;
                    }
                }
            }
            
            if (added) instance_destroy();
        }
    }
}