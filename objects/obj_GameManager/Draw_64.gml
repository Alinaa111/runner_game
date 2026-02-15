draw_set_font(fnt_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var x0 = 20;
var y0 = 20;
var line_h = 32;

var y_cursor = y0;

//  SCORE (always)
var score_text = "SCORE: " + string(floor(global.player_score));

draw_set_color(c_black);
draw_text(x0 + 2, y_cursor + 2, score_text);

draw_set_color(c_white);
draw_text(x0, y_cursor, score_text);

y_cursor += line_h;

//  If game is over nothing to draw
if (state == GameState.GAMEOVER) {
    exit;
}

//  Get the PLAYER
var pl = noone;
if (instance_exists(obj_Player)) {
    pl = instance_find(obj_Player, 0);
}

//  SHIELD 
if (pl != noone && pl.has_shield) {
    draw_sprite(spr_Icon_Shield, 0, x0, y_cursor);
    draw_text(x0 + 36, y_cursor + 4, "SHIELD ACTIVE");
    y_cursor += line_h;
}

//  FLY 
if (pl != noone && pl.alarm[0] > 0) {
    var t = ceil(pl.alarm[0] / obj_GameManager.game_fps);
    draw_sprite(spr_Icon_Fly, 0, x0, y_cursor);
    draw_text(x0 + 36, y_cursor + 4, "FLY: " + string(t) + "s");
    y_cursor += line_h;
}

//  SLOW 
if (alarm[1] > 0) {
    var t = ceil(alarm[1] / obj_GameManager.game_fps);
    draw_sprite(spr_Icon_Slow, 0, x0, y_cursor);
    draw_text(x0 + 36, y_cursor + 4, "SLOW: " + string(t) + "s");
    y_cursor += line_h;
}

//  SPEED DEBUFF 
if (alarm[2] > 0) {
    var t = ceil(alarm[2] / obj_GameManager.game_fps);
    draw_sprite(spr_Icon_Speed, 0, x0, y_cursor);
    draw_text(x0 + 36, y_cursor + 4, "SPEED UP: " + string(t) + "s");
    y_cursor += line_h;
}

