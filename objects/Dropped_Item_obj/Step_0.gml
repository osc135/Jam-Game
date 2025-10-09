//Bob animation
bob_offset = sin((current_time - spawn_time) * 0.005) * bob_height;


//Check collision to pick up
var player = instance_nearest(x, y, StartPlayer_obj);

if (player != noone){
    if (point_distance(x, y, player.x, player.y) < 8){
        // Find the inventory 
        var inv = instance_find(Inventory_obj, 0);
        if (inv != noone){
            if (inventory_add_item(inv, item_id, 1)){
                instance_destroy();
            }
        }
    }
}