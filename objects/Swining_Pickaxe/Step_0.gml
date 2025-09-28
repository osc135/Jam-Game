//Rotation
rotation = lerp(rotation, 45, 0.1);

//making pick face same way as player
image_angle = rotation * StartPlayer_obj.image_xscale;

//Get Input
var _mousePress = mouse_check_button(mb_left);

//Get breakable instance at mouse position
var _breakable = instance_position(mouse_x, mouse_y, Rock_Object);


with (_breakable){
    //Get Distance
    var _dist = distance_to_object(StartPlayer_obj);
    
    // In range check
    if (_dist < other.breakdistance) {
        //click
        if (other.cooldown == 0 && _mousePress){
            //set rotation
            other.rotation = -80;
            
            //set cooldown
            other.cooldown = 20;
        }
    }
}

if (cooldown > 0) cooldown--;