
var scale = 0.7;

if (item_id != undefined && item_id != -1){
    var item_data = variable_struct_get(global.item_list, item_id);
    draw_sprite_ext(item_data.sprite, 0, x, y + bob_offset, scale, scale, 0, c_white, 1);
}

