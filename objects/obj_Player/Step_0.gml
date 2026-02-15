var target_xscale = 1;
var target_yscale = 1;

if (obj_GameManager.state = GameState.GAME) {
	// Flying mode
	
	var next_x = x;
	var next_y = y;
	
    if (grav == 0) {
		// In-flight controls
        if (keyboard_check(vk_up)) next_y -= fly_speed;
        if (keyboard_check(vk_down)) next_y += fly_speed;
        if (keyboard_check(vk_left)) next_x -= fly_speed;
        if (keyboard_check(vk_right)) next_x += fly_speed;

		// Camera limitations
	    var cam = view_camera[0];  
	    var view_left   = camera_get_view_x(cam);
	    var view_right  = view_left + camera_get_view_width(cam);

		var min_y = 192;
		var max_y = 384 ;

        next_x = clamp(next_x, view_left + sprite_width/2, view_right - sprite_width/2);
        next_y = clamp(next_y, min_y, max_y);
		
        //  Ground collision check 
        if (collision_line(x, y, next_x, next_y, obj_Ground, false, true)) {
            // move step by step to avoid passing through ground
            while (!place_meeting(next_x, next_y, obj_Ground)) {
                next_y += sign(fly_speed);
            }
            next_y -= sign(fly_speed); // step back to free space
        }
		
        //  Collect coins along the path 
        var coin_inst = collision_line(x, y, next_x, next_y, obj_Coin, false, true);
        if (coin_inst != noone) {
            with (coin_inst) instance_destroy(); // collect coin
            global.run_coins += 1;
        }

        //  Collect bonuses along the path 
        var bonus_inst = collision_line(x, y, next_x, next_y, obj_Parent_Bonus, false, true);
        if (bonus_inst != noone) {
            with (bonus_inst) instance_destroy(); // collect bonus
            // apply bonus effect here if needed
        }

        //  Apply movement 
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
