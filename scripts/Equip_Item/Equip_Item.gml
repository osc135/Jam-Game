
function Equip_Item(item_id){
    
    if (instance_exists(heldItem)){
        instance_destroy(heldItem);
        heldItem = noone;
    }
    
    switch (item_id) {
        case "pickaxe":
            heldItem = instance_create_layer(x, y, "Instances", Pickaxe_obj);
            break
    }
      
}