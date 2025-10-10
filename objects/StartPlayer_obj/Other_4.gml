var inv = instance_find(Inventory_obj, 0);
if (inv != noone) {
    var item_entry = inv.inventory[inv.selected_slot];
    if (is_struct(item_entry)) {
        switch (item_entry.item_id) {
            case "pickaxe":
                heldItem = instance_create_layer(x, y, "Instances", Pickaxe_obj);
                break;
            case "axe":
                heldItem = instance_create_layer(x, y, "Instances", Axe_obj);
                break;
            case "scythe":
                heldItem = instance_create_layer(x, y, "Instances", Scythe_obj);
                break;
        }
    }
}