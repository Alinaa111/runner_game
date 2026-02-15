if (obj_GameManager.state == GameState.GAMEOVER) {
    fade_alpha = min(fade_alpha + 0.005, 0.5);

    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    draw_set_font(fnt_main);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;
    var sep = 40;

    draw_text(cx, cy - sep, "GAME OVER");
    draw_text(cx, cy, "SCORE: " + string(floor(global.player_score)));
    draw_text(cx, cy + sep, "BEST: " + string(floor(high_score)));
	
	draw_text(cx, cy + 300, "Press SPACE to restart");
}



