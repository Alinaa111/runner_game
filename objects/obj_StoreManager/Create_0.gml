if (instance_number(obj_StoreManager) > 1) {
    instance_destroy();
    exit;
}

// Button / sprite positions
skin_count = 3; 
skin_spacing = 150;
start_x = display_get_gui_width()/2 - (skin_count-1)*skin_spacing/2;
y_pos = display_get_gui_height()/2;

// Button for every skin
for (var i=0; i<skin_count; i++) {
    var b = instance_create_layer(start_x + i*skin_spacing, y_pos, "GUI", obj_StoreButton);
    b.skin_id = i;
}


back_btn = noone;