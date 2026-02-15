var a = alpha * (life / max_life); // fade out

draw_set_alpha(a);
draw_set_color(color);
draw_rectangle(x, y, x + size, y + size, false);
draw_set_alpha(1);
