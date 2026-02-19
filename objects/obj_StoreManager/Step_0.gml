// Back Button
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var padding = 20;

var back_x = padding;             
var back_y = gui_h - padding;     

back_btn = instance_create_layer(back_x, back_y, "GUI", obj_Button_Back);
