// Physics
vsp += gravity;
x += hsp;
y += vsp;

// Slowdown (blurring)
hsp *= drag;
vsp *= drag;

// Fade out
if (alpha < 1) {
    alpha += fade_in_speed;
}

// Life timer
life--;
if (life <= 0) {
    instance_destroy();
}
