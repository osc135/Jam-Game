/*
//draw_set_font

for (var i=0; i < array_length(inv); i++){
    var _xx = 16;
    var _yy = 16;
    var _sep = 16;
    
    draw_sprite(inv[i].sprite, 0, _xx, _yy + _sep * i);
    
    draw_text(_xx + 16, _yy + _sep * i, inv[i].name);
}
