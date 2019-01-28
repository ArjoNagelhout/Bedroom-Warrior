draw_self()
if (can_enter) {
	draw_set_halign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(global.pixel_font)
	//draw_text_transformed(x, y, "PRESS E TO BATTLE!", 3, 3, 0)
	draw_sprite(spr_e, image_index, x, y-40)
}