if (instance_number(obj_GameManager) > 1) {
    instance_destroy();
    exit;
}

persistent = true;

// Game State and initialization
enum GameState {
    MENU,
    GAME,
    GAMEOVER
}

state = GameState.MENU;
prev_state = state;

global.run_coins = 0;
global.total_coins = 0;

ini_open("save.ini");
global.total_coins = ini_read_real("Save", "Coins", 0);
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

// Music
if (!audio_is_playing(snd_music)) {
    audio_play_sound(snd_music, 1, true); 
}


// Текущие скины
global.skin_current = 0;

// Какие скины открыты
global.skin_unlocked = array_create(3, false); 
global.skin_unlocked[0] = true; // basic skin is open

// Цены скинов
global.skin_price = array_create(10, 0);
global.skin_price[1] = 200;
global.skin_price[2] = 500;
