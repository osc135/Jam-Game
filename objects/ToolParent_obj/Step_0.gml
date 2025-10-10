// --- Tool behavior ---
rotation = lerp(rotation, 20, 0.1);

// Flip and rotate with player
var player = instance_find(StartPlayer_obj, 0);
if (instance_exists(player)) {
    
    image_xscale = player.image_xscale; // mirror with player
    image_angle = rotation * image_xscale; // rotate relative to facing
}

// --- Input ---
var _mousePress = mouse_check_button(mb_left);

// --- Universal tool values ---
var break_distance = 32;
var cooldown_time = 20;

// --- Find breakable under mouse ---
var _breakable = instance_position(mouse_x, mouse_y, BreakableParent_obj);

if (_breakable != noone) {
    var player = instance_find(StartPlayer_obj, 0);
    var _dist = distance_to_object(player);

    // Check if close enough
    if (_dist < break_distance) {

        // Check cooldown & click
        if (_mousePress && cooldown <= 0) {

            // Check if this tool can break it
            if (_breakable.required_tool == item_id) {
                _breakable.hp--;

                // Play swing animation
                rotation = -80;

                // Trigger tool cooldown
                cooldown = cooldown_time;

                // Optional: if it broke
                if (_breakable.hp <= 0) {
                    with (_breakable) {
                        instance_destroy(); // Or trigger drop logic
                    }
                }
            } else {
                // Wrong tool feedback (optional)
                show_debug_message("This tool can't break that!");
            }
        }
    }
}

// --- Tool cooldown logic ---
if (cooldown > 0) cooldown--;
