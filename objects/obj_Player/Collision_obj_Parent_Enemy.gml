if (has_shield) {
    // There is a shield - lose the shield, the obstacle is destroyed
    has_shield = false;
    image_blend = c_white;
    
    audio_play_sound(snd_pickup, 1, false);
    
    // Particles
    for (var i = 0; i < 15; i++) {
        var px = instance_create_layer(other.x, other.y, "Instances", obj_Pixel);
        px.color = c_red;
        px.hsp = random_range(-4, 4);
        px.vsp = random_range(-5, -2);
        px.size = 2;
    }
    
    instance_destroy(other);
}
else {
    // No shield - death
	with (obj_GameManager) {
		state = GameState.GAMEOVER;
	}
    global.game_speed = 0;
    
    audio_play_sound(snd_hurt, 1, false);
    
    // Player particles
    for (var i = 0; i < 20; i++) {
        var px = instance_create_layer(x, y, "Instances", obj_Pixel);
        px.color = image_blend;
        px.hsp = random_range(-4, 4);
        px.vsp = random_range(-6, -2);
        px.size = 2;
    }
    
    instance_create_layer(room_width/2, room_height/2, "Instances", obj_GameOver);
    instance_destroy();
}