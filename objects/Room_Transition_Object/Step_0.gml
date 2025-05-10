if(place_meeting(x, y, StartPlayer_obj))
{	
	room_goto(target_room);
	StartPlayer_obj.x = target_x;
	StartPlayer_obj. y = target_y;
	}