global.player_score += 100;
audio_play_sound(snd_pickup, 1, false);

// Particles in selection
for (var i = 0; i < 10; i++) {
    var px = instance_create_layer(other.x, other.y, "Instances", obj_Pixel);
    px.color = c_yellow;
    px.hsp = random_range(-3, 3);
    px.vsp = random_range(-4, -1);
    px.size = 2;
}

instance_destroy(other);