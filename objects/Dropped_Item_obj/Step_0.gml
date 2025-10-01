//Bob animation
bob_offset = sin((current_time - spawn_time) * 0.005) * bob_height;

//Check collision to pick up
var player = instance_nearest(x,y, StartPlayer_obj);

if (player != noone){
    if (point_distance(x,y,player.x,player.y) < 4){
        // find inventory
        var inv = instance_find(Inventory_obj, 0);
        
        if (inv != noone){
            //find empty slot
            inv.add_item(item_id);
            instance_destroy();
        }
    }
}