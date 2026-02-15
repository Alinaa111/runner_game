var target_xscale = 1;
var target_yscale = 1;

if (obj_GameManager.state == GameState.GAME) {
	// Flying mode
	
	if (grav == 0) {
        var next_x = x;
		var next_y = y;

		if (keyboard_check(vk_up))    next_y -= fly_speed;
		if (keyboard_check(vk_down))  next_y += fly_speed;
		if (keyboard_check(vk_left))  next_x -= fly_speed;
		if (keyboard_check(vk_right)) next_x += fly_speed;

		// Camera limits
		var cam = view_camera[0];
		var view_left  = camera_get_view_x(cam);
		var view_right = view_left + camera_get_view_width(cam);

		//next_x = clamp(next_x, view_left + sprite_width/2, view_right - sprite_width/2);
		//next_y = clamp(next_y, 192, 384);

		// APPLY movement ONCE
		x = next_x;
		y = next_y;
		
        sprite_index = spr_Player_Fly;
    }
  
	// Basic mode
    else {
        vsp += grav;

		// Ground collision
        if (place_meeting(x, y + vsp, obj_Ground)) {
            while (!place_meeting(x, y + sign(vsp), obj_Ground)) {
                y += sign(vsp);
            }
            vsp = 0;
			
			target_yscale = 1 - squash_amount;  
            target_xscale = 1 + squash_amount; 
        }

        y += vsp;

		// Jump
        if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, obj_Ground)) {
            vsp = jump_force;
			audio_play_sound(snd_jump, 1, false);
			
			target_yscale = 1 + stretch_amount;  
            target_xscale = 1 - stretch_amount;
        }
		
		
		// Change sprite
        if (place_meeting(x, y + 1, obj_Ground)) {
            sprite_index = spr_Player_Run;
        } else {
            sprite_index = spr_Player_Jump;
        }
    }
}

image_xscale = lerp(image_xscale, target_xscale, lerp_speed);
image_yscale = lerp(image_yscale, target_yscale, lerp_speed);
