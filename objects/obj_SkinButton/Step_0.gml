hover = point_in_rectangle(
    mouse_x, mouse_y,
    rect_left, rect_top,
    rect_right, rect_bottom
);

if (hover && mouse_check_button_pressed(mb_left)) {
	var price = global.skin_price[skin_id];
	
    if (global.skin_unlocked[skin_id]) {
		// choose unlocked skin
        global.skin_current = skin_id;
    } else {
        // buy skin
        if (global.total_coins >= price) {
            global.total_coins -= price;
            global.skin_unlocked[skin_id] = true;
            global.skin_current = skin_id;
        } else {
            show_message("Not enough coins!");
        }
    }

    // Update player
    var skin_map = global.skins[? global.skin_current];
    with (obj_Player) {
        spr_run  = skin_map.run;
        spr_jump = skin_map.jump;
        spr_fly  = skin_map.fly;
        sprite_index = spr_run;
        mask_index   = spr_run;
    }

    ini_open("save.ini");
    ini_write_real("Save", "Coins", global.total_coins);
    ini_write_real("Save", "Skin", global.skin_current);
    ini_write_real("Save", "Skin_" + string(skin_id), global.skin_unlocked[skin_id]);
    ini_close();
}