draw_sprite(global.skin_preview[skin_id], 0, x, y);

var spr_w = sprite_get_width(global.skin_preview[skin_id]);
var spr_h = sprite_get_height(global.skin_preview[skin_id]);

var padding = 20;

var rect_left = x - spr_w/2 + padding;
var rect_top = y - spr_h/2 - padding;
var rect_right = x + spr_w/2 - padding;
var rect_bottom = y + spr_h/2 + padding;

draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_top); 
	
// Blackout
if (!global.skin_unlocked[skin_id]) {
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(rect_left, rect_top, rect_right, rect_bottom, false);
    draw_set_alpha(1);

    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top); 
    draw_text(x, rect_bottom + 50, "LOCKED"); 
	
	var price = global.skin_price[skin_id];
	draw_set_font(fnt_bonus);
	draw_set_color(c_yellow);
    draw_text(x, rect_bottom + 100, string(price) + " Coins");
}
else if (global.skin_current == skin_id) {
    draw_set_color(c_lime);
    draw_text(x, rect_bottom  + 50, "EQUIPPED");
}
else {
    draw_set_color(c_white);
    draw_text(x, rect_bottom + 50, "EQUIP");
}