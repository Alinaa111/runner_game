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

// Unlocked skins
global.skin_count = 3;
global.skin_unlocked = array_create(global.skin_count, false);
global.skin_unlocked[0] = true; // basic skin is open

ini_open("save.ini");
global.total_coins = ini_read_real("Save", "Coins", 0);
global.skin_current = ini_read_real("Save", "Skin", 0);
for (var i = 1; i < global.skin_count; i++) {
    global.skin_unlocked[i] = ini_read_real("Save", "Skin_" + string(i), false);
}
ini_close();


global.base_game_speed = 8;

global.game_speed = global.base_game_speed;
global.player_score = 0;
global.score_multiplier = 1;

// Variables for saving speed
slow_prev_speed = global.game_speed;
speed_prev = global.game_speed;

game_fps = game_get_speed(gamespeed_fps);

ground_y = 448;

// Skin array
global.skin_preview = array_create(3);

global.skin_preview[0] = spr_Player_0;
global.skin_preview[1] = spr_Player_1;
global.skin_preview[2] = spr_Player_2;

// Map for all skins
global.skins = ds_map_create();

// Skins 0
global.skins[? 0] = {
    "run":  spr_Player_0_Run,
    "jump": spr_Player_0_Jump,
    "fly":  spr_Player_0_Fly
};

// Skins 1
global.skins[? 1] = {
    "run":  spr_Player_1_Run,
    "jump": spr_Player_1_Jump,
    "fly":  spr_Player_1_Fly
};

// Skins 2
global.skins[? 2] = {
    "run":  spr_Player_2_Run,
    "jump": spr_Player_2_Jump,
    "fly":  spr_Player_2_Fly
};

btn_start = noone;

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

// Music
if (!audio_is_playing(snd_music)) {
    audio_play_sound(snd_music, 1, true); 
}