/*
// BreakableParent_obj: Step Event
if (mouse_check_button_pressed(mb_left)) {
    var player = instance_nearest(x, y, StartPlayer_obj);
    if (player != noone && instance_exists(player.heldItem)) {
        var held_type = "";
        if (player.heldItem.object_index == Axe_obj) held_type = "axe";
        else if (player.heldItem.object_index == Pickaxe_obj) held_type = "pickaxe";
        // Add more tools here

        // Check if correct tool
        if (held_type == required_tool) {
            health -= 1;
            if (health <= 0) {
                instance_destroy();
                // Optional: create drops here
            }
        } else {
            // Feedback for wrong tool
            show_debug_message("You need a " + string(required_tool) + " to break this.");
        }
    }
}