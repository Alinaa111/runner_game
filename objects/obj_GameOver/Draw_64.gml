if (obj_GameManager.state == GameState.GAMEOVER) {

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
}