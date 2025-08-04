// Handle inventory cycling
if (keyboard_check_pressed(ord("Q"))) {
    selected_slot--;
    if (selected_slot < 0) {
        selected_slot = INVENTORY_SLOTS - 1;
    }
}

if (keyboard_check_pressed(ord("E"))) {
    selected_slot++;
    if (selected_slot >= INVENTORY_SLOTS) {
        selected_slot = 0;
    }
}

// Alternative: Use number keys 1-8 for direct selection
for (var i = 1; i <= min(8, INVENTORY_SLOTS); i++) {
    if (keyboard_check_pressed(ord(string(i)))) {
        selected_slot = i - 1;
    }
}

// Mouse wheel scrolling
var wheel = mouse_wheel_up() - mouse_wheel_down();
if (wheel != 0) {
    selected_slot -= wheel;
    
    // Wrap around
    if (selected_slot < 0) {
        selected_slot = INVENTORY_SLOTS - 1;
    } else if (selected_slot >= INVENTORY_SLOTS) {
        selected_slot = 0;
    }
}