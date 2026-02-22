hover = point_in_rectangle(
    mouse_x, mouse_y,
    x - sprite_width/2,
    y - sprite_height/2,
    x + sprite_width/2,
    y + sprite_height/2
);

if (hover && mouse_check_button_pressed(mb_left)) {
    if (global.skin_unlocked[skin_id])
    {
        global.skin_current = skin_id;
    }
    else
    {
        if (global.total_coins >= global.skin_price)
        {
            global.total_coins -= global.skin_price;
            global.skin_unlocked[skin_id] = true;
        }
    }
}

if (hover && mouse_check_button_pressed(mb_left)) {
    if (global.skin_unlocked[skin_id]) {
		// choose unlocjed skin
        global.skin_current = skin_id;
    } else {
        // buy skin
        if (global.total_coins >= global.skin_price) {
            global.total_coins -= global.skin_price;
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
    ini_close();
}