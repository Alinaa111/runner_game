// Back Button
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var padding = 20;

var w = sprite_get_width(spr_Button_Back);
var h = sprite_get_height(spr_Button_Back);

var back_x = padding + w/2;
var back_y = gui_h - padding - h/2;

back_btn = instance_create_layer(back_x, back_y, "GUI", obj_Button_Back);
