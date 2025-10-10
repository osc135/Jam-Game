// ------------------------
// ToolParent_obj Step Event
// ------------------------

// --- Swing animation ---
rotation = lerp(rotation, 20, 0.1);

// --- Flip & rotate with player ---
var player = instance_find(StartPlayer_obj, 0);
if (!instance_exists(player)) exit;

image_xscale = player.image_xscale;
image_angle = rotation * image_xscale;

// --- Mouse input & cooldown ---
var mouseClick = mouse_check_button_pressed(mb_left);
if (cooldown > 0) cooldown--;

// --- Inventory references ---
var inv = instance_find(Inventory_obj, 0);
var item_entry = noone;
var item_data = undefined;

if (inv != noone) {
    item_entry = inv.inventory[inv.selected_slot];
    if (is_struct(item_entry) && item_entry.item_id != undefined) {
        item_data = variable_struct_get(global.item_list, item_entry.item_id);
    }
}

// --- Object under mouse ---
var grass = instance_position(mouse_x, mouse_y, FarmGrass_obj);
if (grass != noone && mouseClick) { // only trigger on click
    var dist = point_distance(player.x, player.y, grass.x, grass.y);

    if (dist <= 32 && cooldown <= 0) {

        // --- Hoe tiling ---
        if (item_id == "hoe" && grass.image_index == 0) {
            grass.image_index = 1;       // tilled sprite
            grass.tile_state = "tilled";
            rotation = -80;               // swing animation
            cooldown = 20;                // adjust swing speed
            // audio_play_sound(Hoe_Till_snd, 1, false);
        }

        // --- Plant seed ---
        if (item_data.plantable && grass.image_index == 1) {
            grass.tile_state = "planted";
            grass.planted_item = item_entry.item_id;
            grass.image_index = 2; // planted seed sprite
            rotation = -80;
            cooldown = 20;

            // Reduce inventory
            item_entry.amount -= 1;
            if (item_entry.amount <= 0) inv.inventory[inv.selected_slot] = noone;
            else inv.inventory[inv.selected_slot] = item_entry;

            // audio_play_sound(PlantSeed_snd, 1, false);
        }
    }
}

// --- Breakable tool logic (existing) ---
var _breakable = instance_position(mouse_x, mouse_y, BreakableParent_obj);
if (_breakable != noone && mouseClick && cooldown <= 0) {
    var dist = point_distance(player.x, player.y, _breakable.x, _breakable.y);

    if (dist < breakdistance) {
        if (_breakable.required_tool == item_id) {
            _breakable.hp--;
            rotation = -80;
            cooldown = 20;

            if (_breakable.hp <= 0) {
                with (_breakable) instance_destroy();
            }
        } else {
            show_debug_message("This tool can't break that!");
        }
    }
}
