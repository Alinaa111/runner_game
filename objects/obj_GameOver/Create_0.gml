high_score = 0;
fade_alpha = 0;

restart_delay = obj_GameManager.game_fps * 0.5;

restart_btn = noone;
menu_btn = noone;

if (file_exists("save.ini")) {
    ini_open("save.ini");
    high_score = ini_read_real("Scores", "HighScore", 0);
    ini_close();
} else {
    ini_open("save.ini");
    ini_write_real("Scores", "HighScore", 0);
    ini_close();
    high_score = 0;
}

if (global.player_score > high_score) {
    high_score = global.player_score;
    ini_open("save.ini");
    ini_write_real("Scores", "HighScore", high_score);
    ini_close();
}

