
//item constructor
function create_item(_name, _spr, _stack, _drop, _plantable) constructor {
    name = _name;
    sprite = _spr;
    stackable = _stack;
    drop = _drop
    plantable = _plantable;
}


//creating items
global.item_list = {
    
    //tools
    pickaxe : new create_item(
        "Pickaxe",
        Swinging_pickaxe_sprite,
        false,
        true,
        false
        ),
    
    axe : new create_item(
        "Axe",
        Axe_spr,
        false,
        true,
        false
        ),
    
    scythe : new create_item(
        "Scythe",
        Scythe_spr,
        false,
        true,
        false
        ),
    
    hoe : new create_item(
        "Hoe",
        Hoe_spr,
        false,
        true,
        false
        ),
    
    
    
    //items
    fire_flower : new create_item(
        "Fire Flower",
        FireFlower_spr,
        true,
        true,
        false
        ),
    
    water_flower : new create_item(
        "Water Flower",
        WaterFlower_spr,
        true,
        true,
        false
    ),
    
    
    rock : new create_item(
        "rock",
        rock_spr,
        true,
        true,
        false
        ),
    
    mugwort : new create_item(
        "mugwort",
        MugwortLeaf_spr,
        true,
        true,
        false
    ),
    
    bush : new create_item(
        "bush",
        bush_spr,
        true,
        true,
        false
    ),
    
    wood : new create_item(
        "wood",
        wood_spr,
        true,
        true,
        false
    ),
    
    blueberry : new create_item(
        "blueberry",
        BlueBerry_spr,
        true,
        true,
        true
    ),
    
    redberry : new create_item(
        "redberry",
        RedBerry_spr,
        true,
        true,
        true
    ),
    
}