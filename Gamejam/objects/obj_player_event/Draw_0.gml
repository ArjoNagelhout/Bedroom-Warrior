draw_set_alpha(1)

draw_self()
if (holding_throwable) {
	draw_sprite_ext(object_get_sprite(obj_boss.throw_object), 0, throwable_x, throwable_y, 1, 1, throwable_rot, image_blend, image_alpha)
}

//draw_text(x, y-100, "MIN: "+string(min_distance)+"\nMAX: "+string(max_distance)+"\nDIS: "+string(distance)+"\nDEL: "+string(alarm[0]))
