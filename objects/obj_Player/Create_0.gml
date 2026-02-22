// Physics
vsp = 0;          
grav = 0.5;      
jump_force = -12;
has_shield = false;
is_flying = false;
fly_speed = 6;

// Squash & Stretch
image_xscale = 1;
image_yscale = 1;
squash_amount = 0.2;   
stretch_amount = 0.3;  
lerp_speed = 0.2;

// Skin logic
skin_id = global.skin_current;

var skin_map = global.skins[? global.skin_current];

spr_run  = skin_map.run;
spr_jump = skin_map.jump;
spr_fly  = skin_map.fly;

sprite_index = spr_run;
mask_index = spr_run;