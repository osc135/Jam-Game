var _playerExists = instance_exists(StartPlayer_obj);
var _heldItem = noone;

if (_playerExists) _heldItem = StartPlayer_obj.heldItem;


with (all) {
    depth = -bbox_bottom;
    
    //Held Items
    if (_playerExists && _heldItem == id){
        depth -= 10;
    }
    
}