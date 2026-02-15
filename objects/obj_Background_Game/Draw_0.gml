var cam = view_camera[0];

var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

draw_sprite_stretched(spr_Background_Game, 0, vx, vy, vw, vh);

draw_set_color(c_black);
draw_set_alpha(background_alpha);
draw_rectangle(vx, vy, vx + vw, vy + vh, false);
draw_set_alpha(1);
draw_set_color(c_white);
