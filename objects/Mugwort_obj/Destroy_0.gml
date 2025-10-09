// How many
var drop_amount = irandom_range(2, 3);

//stack
var drop = instance_create_layer(x, y, "Instances", Dropped_mugwort_obj);
drop.item_id = "mugwort";
drop.amount = drop_amount;
