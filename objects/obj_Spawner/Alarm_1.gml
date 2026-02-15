var dec_y = irandom_range(250, 400);

instance_create_layer(
    room_width + 100,
    dec_y,
    "Decorations",
    obj_Decoration
);

alarm[1] = irandom_range(90, 180);

show_debug_message("game_speed: " + string(global.game_speed));
