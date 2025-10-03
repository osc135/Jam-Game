//Bob animation
bob_offset = sin((current_time - spawn_time) * 0.005) * bob_height;

//Check collision to pick up
if place_meeting(x, y, StartPlayer_obj){
    if item_add(item) == true{
        instance_destroy();
    }

}