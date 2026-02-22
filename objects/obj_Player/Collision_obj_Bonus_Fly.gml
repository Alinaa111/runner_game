vsp = 0;
grav = 0;              
image_blend = c_aqua;  
is_flying = true;
sprite_index = spr_fly;
mask_index = spr_fly;


alarm[0] = obj_GameManager.game_fps * 7;

audio_play_sound(snd_pickup, 1, false);

// Particles
for (var i = 0; i < 10; i++) {
    var px = instance_create_layer(other.x, other.y, "Instances", obj_Pixel);
    px.color = c_aqua;
    px.hsp = random_range(-3, 3);
    px.vsp = random_range(-4, -1);
    px.size = 2;
}

instance_destroy(other);