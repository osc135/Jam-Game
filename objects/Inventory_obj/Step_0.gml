// 1-8 inv scrolling
for (var i = 1; i <= min(INVENTORY_SLOTS, row_length); i++){
    if (keyboard_check_pressed(ord(string(i)))){
        selected_slot = i-1;
        selected_item = i-1;

    }
}

if selected_slot != -1{
    if keyboard_check_pressed(ord("G")) && inventory[selected_item] == true{
        array_delete(inventory, selected_item, 1);
    }
}