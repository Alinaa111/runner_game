if (restart_delay > 0) {
    restart_delay--;
    exit;
}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
	with (obj_GameManager) {
	    global.player_score = 0;
	    global.game_speed = 8;

	    state = GameState.GAME;
	}

}
