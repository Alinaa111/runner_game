// Save current speed before acceleration
if (obj_GameManager.alarm[2] <= 0) {
    obj_GameManager.speed_prev = global.game_speed;
    global.game_speed += 5;
    obj_GameManager.alarm[2] = obj_GameManager.game_fps * 3;
}

audio_play_sound(snd_pickup, 1, false);

// Particles
for (var i = 0; i < 10; i++) {
    var px = instance_create_layer(other.x, other.y, "Instances", obj_Pixel);
    px.color = c_red;
    px.hsp = random_range(-3, 3);
    px.vsp = random_range(-4, -1);
    px.size = 2;
}

instance_destroy(other);