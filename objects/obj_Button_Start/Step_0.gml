var pulse = 0.05 * sin(current_time / 600) + 1; 
image_xscale = pulse;
image_yscale = pulse;

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
        with (obj_GameManager) {
		    state = GameState.GAME;
		}
    }
}
