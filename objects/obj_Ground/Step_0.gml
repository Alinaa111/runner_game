if (obj_GameManager.state = GameState.GAME) {
    // Move the land to left
    x -= global.game_speed;
    
    // If land goes over the left side
    if (x + sprite_width < 0) {
        // Find the most right side of land
        var rightmost = x;
        
        with (obj_Ground) {
            if (x > rightmost) {
                rightmost = x;
            }
        }
        
        // Teleport this piece to the right without a gap
        x = rightmost + 64;
    }
}