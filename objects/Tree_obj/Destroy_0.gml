// How many
var drop_amount = irandom_range(2, 5);

//Create stack
var drop = instance_create_layer(x, y, "Instances", Dropped_wood_obj);
drop.item_id = "wood";
drop.amount = drop_amount;