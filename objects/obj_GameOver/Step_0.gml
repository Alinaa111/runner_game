if (restart_delay > 0) {
    restart_delay--;
    exit;
}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
	with (obj_GameManager) {
	    global.player_score = 0;
	    global.game_speed = 8;
		global.run_coins = 0;

	    state = GameState.GAME;
	}

}

if (obj_GameManager.state != GameState.GAMEOVER) {
    if (instance_exists(restart_btn)) instance_destroy(restart_btn);
    if (instance_exists(menu_btn)) instance_destroy(menu_btn);

    restart_btn = noone;
    menu_btn = noone;
}

if (obj_GameManager.state == GameState.GAMEOVER)
{
    if (!instance_exists(restart_btn))
    {
        var cx = display_get_gui_width() / 2;
        var cy = display_get_gui_height() / 2;
        var spacing = 200;
		
		var y_pos = cy + 160;   

        var w1 = sprite_get_width(spr_Button_Restart);
		var w2 = sprite_get_width(spr_Button_Menu);

        var restart_x = cx - spacing;
		var menu_x = cx + spacing;

        restart_btn = instance_create_layer(restart_x, y_pos, "GUI", obj_Button_Restart);
        menu_btn = instance_create_layer(menu_x, y_pos, "GUI", obj_Button_Menu);
    }
}
