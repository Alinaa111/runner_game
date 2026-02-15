///  UPDATE DIFFICULTY 

difficulty_timer += 1;

// every 60 frames (1 sec) speed ups
if (difficulty_timer mod 60 == 0) {
    difficulty_level += difficulty_increase_speed;
}
