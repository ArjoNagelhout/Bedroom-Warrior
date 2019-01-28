
im_index = round((distance/max_distance)*sprite_amount)

draw_sprite_ext(spr_event_window_1, im_index, room_width/2, room_height/2, 10, 10, 0, image_blend, image_alpha)

draw_sprite(spr_goal, 0, x, y)
draw_sprite(spr_goal, 0, target_x, target_y)
draw_set_color(c_white)
draw_line_width(x, y, target_x, target_y, 4)

draw_sprite_ext(spr_goal, 0, x_slider, y_slider, 2, 2, 0, image_blend, image_alpha)

