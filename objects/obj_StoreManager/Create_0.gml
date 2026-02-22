if (instance_number(obj_StoreManager) > 1) {
    instance_destroy();
    exit;
}

back_btn = noone;

global.skin_price[0] = 0;   
global.skin_price[1] = 100; 
global.skin_price[2] = 200;  

var cx = display_get_gui_width()/2;
var cy = display_get_gui_height()/2;

var spacing = 300;

for (var i = 0; i < global.skin_count; i++) {
    var btn = instance_create_layer(cx + (i-1)*spacing, cy, "GUI", obj_SkinButton);
    
    btn.skin_id = i;
    
}