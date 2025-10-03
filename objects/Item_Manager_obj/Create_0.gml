
//item constructor
function create_item(_name, _spr, _stack, _drop) constructor {
    name = _name;
    sprite = _spr;
    stackable = _stack;
    drop = _drop
}


//creating items
global.item_list = {
    
    
    red_flower : new create_item(
        "Fire Flower",
        FireFlower_spr,
        true,
        true
        ),
    
    
    rock : new create_item(
        "rock",
        rock_spr,
        true,
        true
        ),
    
    test : new create_item(
        "test",
        Inventory_item,
        true,
        true
        ),
    
}