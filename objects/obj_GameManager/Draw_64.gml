draw_set_font(fnt_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Settings
var x0 = 20;
var y0 = 20;
var line_h = 32;
var icon_spacing = 8;

var y_cursor = y0;

//  GAME SCORE
var score_text = "SCORE: " + string(floor(global.player_score));

draw_set_color(c_black);
draw_text(x0 + 2, y_cursor + 2, score_text);

// Main text
draw_set_color(c_white);
draw_text(x0, y_cursor, score_text);

y_cursor += line_h;

// Check if game is over
if (state == GameState.GAMEOVER) {
    exit;
}

//  Get the PLAYER
var pl = noone;
if (instance_exists(obj_Player)) {
    pl = instance_find(obj_Player, 0);
}

// --- COIN SCORE ---
var margin = 120;
var x_pos = 1200 - sprite_get_width(spr_Coin);
var y_pos = 22; 

draw_sprite(spr_Coin, 0, x_pos, y_pos);

// Draw coin count
draw_set_color(c_yellow);
draw_set_font(fnt_bonus);

var coins_to_show = 0;  

switch(state) {
    case GameState.MENU:
        // Total score in menu
        coins_to_show = global.total_coins;
		draw_text(x_pos + sprite_get_width(spr_Coin) + icon_spacing, y_pos, string(coins_to_show));
        break;
    case GameState.GAME:
        // Current coins in the game
        coins_to_show = global.run_coins;
		draw_text(x_pos + sprite_get_width(spr_Coin) + icon_spacing, y_pos, string(coins_to_show));
        break;
}


// --- BONUS ICONS ---

//  SHIELD 
if (pl != noone && pl.has_shield) {
	draw_set_font(fnt_bonus);
    draw_sprite(spr_Icon_Shield, 0, x0, y_cursor);
	var icon_w = sprite_get_width(spr_Icon_Shield);
    draw_text(x0 + icon_w + icon_spacing, y_cursor + 4, "SHIELD ACTIVE");
    y_cursor += line_h;
}

//  FLY 
if (pl != noone && pl.alarm[0] > 0) {
	draw_set_font(fnt_bonus);
    var t = ceil(pl.alarm[0] / obj_GameManager.game_fps);
    draw_sprite(spr_Icon_Fly, 0, x0, y_cursor);
	var icon_w = sprite_get_width(spr_Icon_Fly);
    draw_text(x0 + icon_w + icon_spacing, y_cursor + 4, "FLY: " + string(t) + "s");
	y_cursor += line_h;
	
	/// Info block about control
	// Position and size of block
    var block_x = 20;
    var block_y = y_cursor + 20;
    var block_w = 300;
    var block_h = 140;

    // Background (translucent)
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_set_alpha(0.6);
    draw_rectangle(block_x, block_y, block_x + block_w, block_y + block_h, false);
    draw_set_alpha(1);

    // Draw frame
    draw_set_color(c_white);
    draw_rectangle(block_x, block_y, block_x + block_w, block_y + block_h, true);

    // Write text with instructions
    draw_set_color(c_white);
    draw_set_font(fnt_desc);

    var text_x = block_x + 10;
    var text_y = block_y + 10;
    line_h = 24;

    draw_text(text_x, text_y, "FLY MODE CONTROLS:");
    draw_text(text_x, text_y + line_h, "UP: Move Up");
    draw_text(text_x, text_y + 2*line_h, "DOWN: Move Down");
    draw_text(text_x, text_y + 3*line_h, "LEFT: Move Left");
    draw_text(text_x, text_y + 4*line_h, "RIGHT: Move Right");

    // Update y_cursor, for the HUD to be lower
    y_cursor = block_y + block_h + 10;
}

//  SLOW 
if (alarm[1] > 0) {
	draw_set_font(fnt_bonus);
    var t = ceil(alarm[1] / obj_GameManager.game_fps);
    draw_sprite(spr_Icon_Slow, 0, x0, y_cursor);
	var icon_w = sprite_get_width(spr_Icon_Slow);
    draw_text(x0 + icon_w + icon_spacing, y_cursor + 4, "SLOW: " + string(t) + "s");
    y_cursor += line_h;
}

//  SPEED DEBUFF 
if (alarm[2] > 0) {
	draw_set_font(fnt_bonus);
    var t = ceil(alarm[2] / obj_GameManager.game_fps);
    draw_sprite(spr_Icon_Speed, 0, x0, y_cursor);
	var icon_w = sprite_get_width(spr_Icon_Speed);
    draw_text(x0 + icon_w + icon_spacing, y_cursor + 4, "SPEED UP: " + string(t) + "s");
    y_cursor += line_h;
}

