if (obj_GameManager.state == GameState.GAMEOVER) {
    background_alpha = min(background_alpha + 0.0005, 0.5);
} else {
    background_alpha = 0.7;
}
