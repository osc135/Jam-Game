right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
shift_key = keyboard_check(vk_shift);

var chest_open = false;
with (Chest_obj) {
    if (is_open) chest_open = true;
}
if (chest_open) moveSpeed = 0;
    else moveSpeed = 1;

//Calculating Direction with sprint
	//sprint seems weird amount, come back to change maybe 
var current_speed = shift_key ? moveSpeed * 1.5 : moveSpeed;
moveX = (right_key - left_key) * current_speed;
moveY = (down_key - up_key) * current_speed;

//Collisions
if (collision(x + moveX, y)){
    //Moves player pixel by pixel to ensure collision
    while (!collision(x + sign(moveX), y)){
        x += sign(moveX)
    }
    
    moveX = 0;
}
if (collision(x, y + moveY)){
    while (!collision(x, y + sign(moveY))){
        y += sign(moveY)
    }
    
    moveY = 0;
}

x += moveX;
y += moveY;

//Animation: Move
if (moveX != 0 or moveY != 0){
    sprite_index = PlayerMove_spr;
    
    //Facing
    if (moveX != 0) image_xscale = sign(moveX);
}
else{
    sprite_index = PlayerIdle_spr;
}


// Equip item based on slot
var inv = instance_find(Inventory_obj, 0);

if inv != noone{
    var item_entry = inv.inventory[inv.selected_slot];
    
    if (is_struct(item_entry)){
        var item_id = item_entry.item_id;
        
        if (item_id == "pickaxe" || item_id == "axe" || item_id == "scythe"){
            //Checking if holding is the right object
            if(instance_exists(heldItem)){
                var held_type = heldItem.object_index;
                if ((item_id == "pickaxe" && held_type != Pickaxe_obj) ||
                    (item_id == "axe" && held_type != Axe_obj) ||
                    (item_id == "scythe" && held_type != Scythe_obj)){
                        instance_destroy(heldItem);
                        heldItem = noone;
                }
            }
            
            //If nothing held
            if (!instance_exists(heldItem)){
                switch (item_id){
                    case "pickaxe":
                        heldItem = instance_create_layer(x, y, "Instances", Pickaxe_obj);
                        break;
                    
                    case "axe":
                        heldItem = instance_create_layer(x, y, "Instances", Axe_obj);
                        break;
                    
                    case "scythe":
                        heldItem = instance_create_layer(x, y, "Instances", Scythe_obj);
                        break;
                    
                    default:
                        if (instance_exists(heldItem)){
                            instance_destroy(heldItem);
                            heldItem = noone;
                        }
                        break;
                }
            }
        }
        else{
            if (instance_exists(heldItem)){
            instance_destroy(heldItem);
            heldItem = noone;
            }
        }
    } else{
        //destroy if slot empty
        if (instance_exists(heldItem)){
            instance_destroy(heldItem);
            heldItem = noone;
        }
    }
}

// --- Open / close chest with right-click ---
if (mouse_check_button_pressed(mb_right)) {
    var chest = instance_position(mouse_x, mouse_y, Chest_obj);

    if (chest != noone) {
        var dist = point_distance(x, y, chest.x, chest.y);
        if (dist < 32) {
            chest.is_open = !chest.is_open;
        }
    }
}

#region OLD