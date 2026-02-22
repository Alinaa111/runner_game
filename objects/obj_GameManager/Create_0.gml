if (instance_number(obj_GameManager) > 1) {
    instance_destroy();
    exit;
}

persistent = true;

// Game State and initialization
enum GameState {
    MENU,
    GAME,
    GAMEOVER,
	STORE
}

state = GameState.MENU;
prev_state = state;

global.run_coins = 0;
global.total_coins = 0;

ini_open("save.ini");
global.total_coins = ini_read_real("Save", "Coins", 0);
ini_close();

btn_start = noone;

global.base_game_speed = 8;

global.game_speed = global.base_game_speed;
global.player_score = 0;
global.score_multiplier = 1;

// Variables for saving speed
slow_prev_speed = global.game_speed;
speed_prev = global.game_speed;

game_fps = game_get_speed(gamespeed_fps);

ground_y = 448;

// Music
if (!audio_is_playing(snd_music)) {
    audio_play_sound(snd_music, 1, true); 
}


// Current skin
global.skin_current = 0;

// Unlocked skins
global.skin_count = 3;
global.skin_unlocked = array_create(global.skin_count, false);
global.skin_unlocked[0] = true; // basic skin is open

// Skin array
global.skin_preview = array_create(3);

global.skin_preview[0] = spr_Player_0;
global.skin_preview[1] = spr_Player_1;
global.skin_preview[2] = spr_Player_2;

// Delete buttons
function destroy_menu_buttons() {
    with (obj_Button_Start) instance_destroy();
    with (obj_Button_Shop) instance_destroy();
}

function destroy_gameover_buttons() {
    with (obj_Button_Restart) instance_destroy();
    with (obj_Button_Menu) instance_destroy();
    with (obj_Btn_Shop_GameOver) instance_destroy();
}

function destroy_store_buttons() {
    with (obj_SkinButton) instance_destroy();
    with (obj_Button_Back) instance_destroy();
}