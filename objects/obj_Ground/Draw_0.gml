// Draw sprite
draw_self();

draw_line(x, y, x, y + sprite_height);
draw_line(x + sprite_width, y, x + sprite_width, y + sprite_height);
draw_set_color(c_white);
