if (obj_GameManager.alarm[1] <= 0) {
    obj_GameManager.slow_prev_speed = global.game_speed;
    global.game_speed = max(0, global.game_speed - 3);
    obj_GameManager.alarm[1] = obj_GameManager.game_fps * 5;
}

audio_play_sound(snd_pickup, 1, false);

// Particles
for (var i = 0; i < 10; i++) {
    var px = instance_create_layer(other.x, other.y, "Instances", obj_Pixel);
    px.color = c_lime;
    px.hsp = random_range(-3, 3);
    px.vsp = random_range(-4, -1);
    px.size = 2;
}

instance_destroy(other);