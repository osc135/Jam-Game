// 1-8 inv scrolling
for (var i = 1; i <= min(INVENTORY_SLOTS, row_length); i++){
    if (keyboard_check_pressed(ord(string(i)))){
        selected_slot = i-1;

    }
}