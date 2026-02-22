if (state != prev_state) {

    switch (state) {

        case GameState.MENU:
			with (obj_Button_Back) instance_destroy();
			destroy_gameover_buttons();
			destroy_store_buttons();
			
			global.player_score = 0;
			global.run_coins = 0;
            room_goto(rm_Main);

            break;

        case GameState.GAME:
			global.player_score = 0;
		    global.game_speed = 8;
			global.run_coins = 0;
			
			destroy_gameover_buttons();
			destroy_menu_buttons();
			destroy_store_buttons();

		    room_goto(rm_Game);
		    break;

        case GameState.GAMEOVER:
			global.total_coins += global.run_coins;
            global.run_coins = 0;
            ini_open("save.ini");
            ini_write_real("Save", "Coins", global.total_coins);
			ini_write_real("Save", "Skin", global.skin_current); 
            ini_close();
            break;
		
		case GameState.STORE:
			destroy_gameover_buttons();
			destroy_menu_buttons();
			
			room_goto(rm_Store);
            break;
		
    }

    prev_state = state;
}

// Game Logic
switch (state) {
	case GameState.MENU: 
		if (!instance_exists(btn_start)) {

		    var cx = display_get_gui_width() / 2;
		    var cy = display_get_gui_height() / 2;

		    btn_start = instance_create_layer(
		        cx,
		        cy - 80, 
		        "GUI",
		        obj_Button_Start
		    );

		    btn_shop = instance_create_layer(
		        cx,
		        cy + 100,  
		        "GUI",
		        obj_Button_Shop
		    );
		}

		break;
		
	case GameState.GAME:
		
		// Score
		global.player_score += global.game_speed * 0.1;
    
		// Gradual acceleration
		global.game_speed += 0.0005;
		if (global.game_speed > 20) global.game_speed = 20;
	
		// Ground movement (TILEMAP)
		var tile_layer = layer_get_id("Tiles");
		if (tile_layer != -1) {
			var current_x = layer_get_x(tile_layer);
			layer_x(tile_layer, current_x - global.game_speed);
    
			// Loop for each 64 pixels (1 tile size)
			if (current_x <= -64) {
			    layer_x(tile_layer, current_x + 64);
			}
		}
			
		break;
		
	case GameState.GAMEOVER:
		break;
		
	case GameState.STORE:
		break;
}
	

