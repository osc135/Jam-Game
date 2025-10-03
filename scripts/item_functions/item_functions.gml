function item_add(_item){
    
    var _added = false;
    
    if array_length(Inventory_obj.inventory) < Inventory_obj.row_length{
        
        array_push(Inventory_obj.inventory, _item);
        _added = true;
        show_debug_message("Added Item");
        
    }
    
    return _added;
    
    
}