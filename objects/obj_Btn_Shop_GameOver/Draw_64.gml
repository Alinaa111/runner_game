// Hover effect
var mx = mouse_x;
var my = mouse_y;

var hover = point_in_rectangle(mx, my, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2);

if (hover) {
    draw_set_color(c_yellow);
    draw_sprite_ext(sprite_index, 0, x, y, 1.1, 1.1, 0, c_white, 1); 
} else {
    draw_set_color(c_white);
    draw_sprite(sprite_index, 0, x, y);
}

// Click
if (hover && mouse_check_button_pressed(mb_left)) {
    if (object_index == obj_Button_Restart) {
        with (obj_GameManager) {
            global.player_score = 0;
            global.game_speed = 8;
            global.run_coins = 0;
            state = GameState.GAME;
        }
    } else if (object_index == obj_Button_Menu) {
         obj_GameManager.state = GameState.MENU;
    } else if (object_index == obj_Btn_Shop_GameOver) {
         obj_GameManager.state = GameState.STORE;
    }
}
