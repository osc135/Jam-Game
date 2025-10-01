var data = global.item_list[item_id];

if (!is_undefined(data)){
    var scale = 0.7;
    draw_sprite_ext(data.sprite, 0, x, y + bob_offset, scale, scale, 0, c_white, 1);
} else{
    draw_self();
}
