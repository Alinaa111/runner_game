x -= global.game_speed * parallax;

if (x < -sprite_width * image_xscale) {
    instance_destroy();
}
