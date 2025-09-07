 //The amount of slots in the inventory
#macro INVENTORY_SLOTS  8

rowLength = 8;
inventory = array_create(INVENTORY_SLOTS, -1);
selected_slot = 0;

//testing 

inventory[0] = 0;
inventory[1] = 0;
inventory[2] = 1;