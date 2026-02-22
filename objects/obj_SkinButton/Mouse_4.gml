if (!global.skin_unlocked[skin_id]) {
    // purchase
    if (global.total_coins >= global.skin_price) {
        global.total_coins -= global.skin_price;
        global.skin_unlocked[skin_id] = true;
        global.skin_current = skin_id;
    }
    else {
		show_message("Not enough coins!");
    }
}
else {
    global.skin_current = skin_id;
}

