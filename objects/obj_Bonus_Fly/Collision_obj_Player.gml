var ps = part_system_create();
part_system_depth(ps, -100);

var pt = part_type_create();
part_type_shape(pt, pt_shape_square);
part_type_size(pt, 0.1, 0.3, 0, 0);
part_type_color1(pt, part_color); 
part_type_life(pt, 15, 30);
part_type_speed(pt, 2, 5, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_alpha2(pt, 1, 0);

part_particles_create(ps, x, y, pt, 10);

instance_destroy(); 
