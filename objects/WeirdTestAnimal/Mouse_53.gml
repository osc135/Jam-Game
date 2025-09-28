// Mouse Left Pressed event - trigger dialogue when clicking on the pet
// Check if player is close enough
if (instance_exists(StartPlayer_obj)) {
    var dist = point_distance(x, y, StartPlayer_obj.x, StartPlayer_obj.y);
    
    if (dist <= interaction_range) {
        // Create textbox if it doesn't exist
        if (!instance_exists(Textbox_object)) {
            var textbox = instance_create_layer(0, 0, "Instances", Textbox_object);
            
            // Pick a random dialogue line
            var random_text = dialogue_text[irandom(array_length(dialogue_text) - 1)];
            
            // Set the textbox properties
            with(textbox) {
                // Set the text array with the dialogue
                text[0] = random_text;
                text_length[0] = string_length(text[0]);
                
                // Position the textbox at the bottom of the screen
                textbox_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - textbox_width/2;
                textbox_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - textbox_height - 20;
            }
        }
    }
}