if (state != prev_state) {

    switch (state) {

        case GameState.MENU:
            room_goto(rm_Main);
            break;

        case GameState.GAME:
			global.player_score = 0;
		    global.game_speed = 8;

		    room_goto(rm_Game);
		    break;

        case GameState.GAMEOVER:
            break;
    }

    prev_state = state;
}

switch (state) {
	case GameState.MENU: 
		break;
		
	case GameState.GAME:
	
		// Scoring
		global.player_score += global.game_speed * 0.1;
    
		// Gradual acceleration
		global.game_speed += 0.0005;
		if (global.game_speed > 20) {
		    global.game_speed = 20;
		}
	
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
		//global.game_over = true;
		break;
}
	

