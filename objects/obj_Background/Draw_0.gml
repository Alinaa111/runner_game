switch (obj_GameManager.state) {
    // Game
    case GameState.GAME:
    case GameState.GAMEOVER:
    
        var cam = view_camera[0];

        var vx = camera_get_view_x(cam);
        var vy = camera_get_view_y(cam);
        var vw = camera_get_view_width(cam);
        var vh = camera_get_view_height(cam);

        draw_sprite_stretched(spr_Background, 0, vx, vy, vw, vh);

        draw_set_color(c_black);
        draw_set_alpha(background_alpha);
        draw_rectangle(vx, vy, vx + vw, vy + vh, false);
        draw_set_alpha(1);
        draw_set_color(c_white);

    break;


   // Menu
    case GameState.MENU:
        draw_sprite(
            spr_Background, 0, room_width / 2, room_height / 2);

        draw_set_color(c_black);
        draw_set_alpha(0.5);
        draw_rectangle(0, 0, room_width, room_height, false);
        draw_set_alpha(1);
        draw_set_color(c_white);

    break;
}