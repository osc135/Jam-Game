
//item constructor
function create_item(_name, _spr, _stack, _drop) constructor {
    name = _name;
    sprite = _spr;
    stackable = _stack;
    drop = _drop
}


//creating items
global.item_list = {
    
    //tools
    pickaxe : new create_item(
        "Pickaxe",
        Swinging_pickaxe_sprite,
        false,
        true
        ),
    
    //items
    fire_flower : new create_item(
        "Fire Flower",
        FireFlower_spr,
        true,
        true
        ),
    
    water_flower : new create_item(
        "Water Flower",
        WaterFlower_spr,
        true,
        true
    ),
    
    
    rock : new create_item(
        "rock",
        rock_spr,
        true,
        true
        ),
    
    mugwort : new create_item(
        "mugwort",
        MugwortLeaf_spr,
        true,
        true
    ),
    
    bush : new create_item(
        "bush",
        bush_spr,
        true,
        true
    ),
    
    wood : new create_item(
        "wood",
        wood_spr,
        true,
        true
    ),
    
    blueberry : new create_item(
        "blueberry",
        BlueBerry_spr,
        true,
        true
    ),
    
    redberry : new create_item(
        "redberry",
        RedBerry_spr,
        true,
        true
    ),
    
    ah : new create_item(
        "ah",
        Ah_spr,
        true,
        true
    ),
    
}