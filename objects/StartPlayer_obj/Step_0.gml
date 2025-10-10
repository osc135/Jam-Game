right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
shift_key = keyboard_check(vk_shift);


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



#region Old
// OLD Set Sprite
/*
mask_index = sprite[DOWN];
if yspeed == 0 {

    if xspeed > 0 {face = RIGHT};
    if xspeed < 0 {face = LEFT};
}

if xspeed > 0 && face == LEFT {face = RIGHT};
if xspeed < 0 && face == RIGHT {face = LEFT};

if xspeed == 0 {
    if yspeed > 0 {face = DOWN};
    if yspeed < 0 {face = UP};
}
if yspeed > 0 && face == UP {face = DOWN};
if yspeed < 0 && face == DOWN {face = UP};

sprite_index = sprite[face];

*/



/*
// OLD Checking Collisions
if place_meeting(x + moveX, y, wall_obj) == true
    {
    moveX = 0
    }
if place_meeting(x, y + moveY, wall_obj) == true
    {
    moveY = 0
    }
/*

/*
//Checks if key pressed is Z for pickaxe
    if (keyboard_check_pressed(ord("Z"))) {
        var offsetX = 12;
        var offsetY = 0
        switch(face){
            case RIGHT:
                //offsetX = 12;
                offsetY = 2;
                break;
            case LEFT:
                offsetX = -12;
                //offsetY = 2;
                break;
            case UP:
                //offsetX = 12;
                offsetY = -2;
                break;
            case DOWN:
                //offsetX = 12;
                offsetY = 2;
                break; 
            
    }	
            
//  var swing = instance_create_layer(x + offsetX, y + offsetY, "Instances", Swining_Pickaxe);
// swing.image_xscale = image_xscale;
}
*/
#endregion
