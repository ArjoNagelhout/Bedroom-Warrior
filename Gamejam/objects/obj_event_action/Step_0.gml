if (finished == false) {
	distance -= decrease_val

	if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"))) {
		distance += increase_val
	}
}

distance = clamp(distance, 0, max_distance)

if (distance == max_distance && finished == false) {
	finished = true
	alarm[0] = time_after
}


x_slider = x+distance * cos(angle)
y_slider = y+distance * sin(angle)