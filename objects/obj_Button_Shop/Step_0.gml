var pulse = 0.05 * sin(current_time / 600) + 1; 
image_xscale = pulse;
image_yscale = pulse;

if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		obj_GameManager.state = GameState.STORE;
	}
}

