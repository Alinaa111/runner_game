hover = point_in_rectangle(
    mouse_x, mouse_y,
    x - sprite_width/2,
    y - sprite_height/2,
    x + sprite_width/2,
    y + sprite_height/2
);

if (hover && mouse_check_button_pressed(mb_left))
{
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