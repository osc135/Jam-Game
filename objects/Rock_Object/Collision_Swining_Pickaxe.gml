hit_remaining -= 1;

//makes it so the swing doenst autoswing
other.instance_destory();

if (hits_remaining <= 0) {

    var drop = instance_create_layer(x, y, "Instances", obj_item);
    drop.itemType = ROCK_ID;    
    instance_destroy();
}
