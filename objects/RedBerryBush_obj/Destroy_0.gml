// How many
var drop_amount = irandom_range(2, 4);

//stack
var drop = instance_create_layer(x, y, "Instances", Dropped_RedBerry_obj);
drop.item_id = "redberry";
drop.amount = drop_amount;

instance_create_layer(x, y, "Instances", Bush_obj);