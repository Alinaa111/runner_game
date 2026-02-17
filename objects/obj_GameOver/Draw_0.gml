if (obj_GameManager.state == GameState.GAMEOVER) {
    fade_alpha = min(fade_alpha + 0.005, 0.5);

    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}