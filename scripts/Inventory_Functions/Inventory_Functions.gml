
function inventory_add_item(inv_ref, _item_id, _amount){
    var item_data = variable_struct_get(global.item_list, _item_id);
    var inv = inv_ref.inventory;
    
    //try stacking 
    for (var i=0; i < array_length(inv); i++){
        if (is_struct(inv[i])){
            if (inv[i].item_id == _item_id && item_data.stackable){
                inv[i].amount += _amount;
                return true;
            }
        }
    }
    
    //If not stacked
    for (var i=0; i < array_length(inv); i++){
        if (inv[i] == noone || inv[i] == -1){
            inv[i] = {item_id:_item_id, amount:_amount};
            inv_ref.inventory = inv;
            return true;
        }
    }
    
    //Inventory full
    return false;
}







#region Old code idk if we wanna keep


/*
function InventorySearch(rootObject, itemType){
	for(var i = 0; i < INVENTORY_SLOTS; i ++){
		if(rootObject.inventory[i] == itemType){
			return(1)
		}
	}
	return (-1);
}

function InventoryRemove(rootObject, itemType){
	var slot = InventorySearch(rootObject, itemType);
	if(slot != -1){
		with(rootObject) inventory[slot] =-1;
		return true;
	}
	else return false;
}

function InventoryAdd(rootObject, itemType){
	var slot = InventorySearch(rootObject, -1);
	
		//looking for item in inventory to add to it
		for(var i = 0; i < INVENTORY_SLOTS; i ++){
			if(inventoryType[i] == itemType && inventoryCount[i] < 64){
				iventoryCount[i] += 1;
				return true;
			}
		}
		
		//if the item does not already exist in inventory
		for( var i = 0; i < INVENTORY_SLOTS; i ++){
			if(inventoryType[i] == -1){
				inventoryType[i] = itemType;
				inventoryCount[i] = 1;
				return true;
			}
		}
		//if the inventory has no slots, dont add it
		return false;
}

//CHATGPT helped 
function InventoryCounter(rootObject, itemType){
	var count = 0;
	with(rootObject){
		for (var i = 0; i < INVENTORY_SLOTS; i++){
			if(inventory[i] == itemType){
				count += inventoryCount[i];
			}
		}
	}
	return count;
}

function InventoryDropOne(rootObject){
	with(rootObject){
		//remember empty is -1 
		if(inventory[i] != -1){
			//drops the item at the players position
			var dropped = instance_create_layer(x, y, "Instances", obj_item);
			dropped.itemType = inventory[i];
			
			//removing one from the inventory 
			inventoryCount[i] -= 1;
			
			//if it was the last item type in inventory, clear the slot 
			if(inventoryCount <= 0){
				inventoryCount[i] = 0;
				inventoryType = -1;
			}
			return true;
		}
	}
	return false;
}
	
			*/
			
	#endregion