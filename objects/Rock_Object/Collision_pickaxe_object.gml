if(hits.remaining > 0){
	hits.remaining -=1;
	
	if(hits.remaning <= 0){
		instance_create_layer(other.x, other.y, "Instances", obj_rock_piece);
        with (other) instance_destroy();
	}
}


instance_destroy();