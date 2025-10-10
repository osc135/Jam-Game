var _playerExists = instance_exists(StartPlayer_obj);
var _heldItem = noone;

if (_playerExists) _heldItem = StartPlayer_obj.heldItem;


with (all) {
    if (object_index != FarmGrass_obj) {
        depth = -bbox_bottom;
    
        if (_playerExists && _heldItem == id) {
            depth -= 10;
        }
    }
    
}