// STATES

switch (current_state) {
	case INTERACTABLE_STATES.dark: {
		alarm[0] = -1
		sprite_index = dark_sprite
		can_enter = false
	}; break;
	case INTERACTABLE_STATES.scary: {
		sprite_index = scary_sprite
		if (alarm[0] == -1) {
			alarm[0] = wiggle_interval
		}
		
		if (distance_to_object(obj_player) < max_distance) {
			can_enter = true
		} else {
			can_enter = false
		}

		if (can_enter) {
			if (keyboard_check_released(ord("E"))) {
				// ENTER EVENT
				
				event_enter()
			}
		}
		
	}; break;
	case INTERACTABLE_STATES.bright: {
		alarm[0] = -1
		sprite_index = bright_sprite
		can_enter = false
	}; break;
}