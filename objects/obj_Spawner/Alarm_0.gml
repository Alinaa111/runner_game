///  SPAWN LOGIC 

var roll = random(1);
var spawn_x = x;  
var spawn_y;

// Obstacle chance grows with every difficulty level
var obstacle_ground_chance = 0.55 + (0.05 * (difficulty_level - 1)); // +5% for every level
var coin_chance = 0.30 - (0.05 * (difficulty_level - 1));           // coins go rarely
var obstacle_air_chance = 0.10 + (0.05 * (difficulty_level - 1));   // +5% for every level

/// 55% — Ground obstacle
if (roll < obstacle_ground_chance) {
    spawn_y = 448;
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_Obstacle_Ground);
}

/// 30% — Coin
else if (roll < obstacle_ground_chance + coin_chance) {
    spawn_y = irandom_range(310, 410);
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_Coin);
	instance_create_layer(spawn_x, spawn_y, "Instances", obj_Bonus_Fly);
}

/// 10% — Air obstacle
else if (roll < obstacle_ground_chance + coin_chance + obstacle_air_chance) {
    spawn_y = irandom_range(330, 400);
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_Obstacle_Air);
}

/// 5% — Rare items
else {
    spawn_y = irandom_range(310, 410);
    var bonus_roll = random(1);
    
    if (bonus_roll < 0.4)
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_Bonus_Shield);
    else if (bonus_roll < 0.7)
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_Bonus_Slow);
    else if (bonus_roll < 0.9)
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_Bonus_Fly);
    else
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_Debuff_Speed);
}


///  SPAWN TIMER 

var alarm_time = base_spawn_time * (8 / global.game_speed);
alarm_time = clamp(alarm_time, min_spawn_time, max_spawn_time);

alarm[0] = round(alarm_time);

