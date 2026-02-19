draw_set_color(c_black);
draw_text(20, 20, "COINS: " + string(global.total_coins));
draw_set_color(c_white);
draw_text(display_get_gui_width()/2, 50, "STORE");

draw_set_color(c_white);

// Skins
//for (var i = 0; i < 3; i++) { 
//    var sx = x + i * 120;
//    var sy = y;

//    if (global.skin_unlocked[i]) {
//        draw_sprite(spr_Skin[i], 0, sx, sy);
//    } else {
//        draw_sprite(spr_SkinLocked[i], 0, sx, sy);
//        draw_text(sx, sy + 60, string(global.skin_price[i]));
//    }

//    var hover = point_in_rectangle(mouse_x, mouse_y, sx - 32, sy - 32, sx + 32, sy + 32);
//    if (hover) {
//        draw_rectangle(sx - 36, sy - 36, sx + 36, sy + 36, false);
//    }
//}
