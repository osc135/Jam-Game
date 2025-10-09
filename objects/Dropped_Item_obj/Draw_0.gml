var item_data = variable_struct_get(global.item_list, item_id);
if (!is_struct(item_data)) exit; //safety :p
var spr = item_data.sprite;

var scale = 0.7;
var pile_count = clamp(amount, 1, 5);

if (!variable_instance_exists(id, "pile_offsets")){
    pile_offsets = array_create(pile_count);
    for (var i = 0; i < pile_count; i++){
        pile_offsets[i] = [random_range(-2,2), random_range(-2, 2)];
    }
}

for (var i = 0; i < array_length(pile_offsets); i++){
    var off = pile_offsets[i];
    draw_sprite_ext(spr, 0, x + off[0], y + off[1] + bob_offset, scale, scale, 0, c_white, 1);
}

//if (item_id != undefined && item_id != -1){
//    var item_data = variable_struct_get(global.item_list, item_id);
//    draw_sprite_ext(item_data.sprite, 0, x, y + bob_offset, scale, scale, 0, c_white, 1);
//}

