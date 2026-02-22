if (obj_GameManager.state == GameState.GAMEOVER) {
    background_alpha = min(background_alpha + 0.0005, 0.5);
} 
else if (obj_GameManager.state == GameState.GAME) {
    background_alpha = 0.7;
}