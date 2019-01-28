switch (current_state) {
	case BOSS_STATES.start: {
		if (alarm[0] == -1) {
			alarm[0] = start_time
			sprite_index = start_sprite
		}
	}; break;
	case BOSS_STATES.throw: {
		if (alarm[1] == -1) {
			alarm[1] = throw_time
			sprite_index = throw_sprite
		}
		
		if (alarm[3] == -1) {
			alarm[3] = throw_interval
		}
		
		
	}; break;
	case BOSS_STATES.vulnerable: {
		if (alarm[2] == -1) {
			alarm[2] = vulnerable_time
			sprite_index = vulnerable_sprite
		}
		
		if (place_meeting(x, y, obj_throw)) {
			if (instance_nearest(x,y,obj_throw).deadly_timer == 0) {
				current_state = BOSS_STATES.hit
				current_health -= 1
				alarm[2] = -1
				with (instance_nearest(x,y,obj_throw)) {
					instance_destroy()
				}
			} 
		}
		
	}; break;
	case BOSS_STATES.hit: {
		if (alarm[4] == -1) {
			alarm[4] = hit_time
			sprite_index = hit_sprite
		}
	}; break;
	case BOSS_STATES.dead: {
		if (alarm[5] == -1) {
			alarm[5] = dead_time
			sprite_index = dead_sprite
			instance_destroy(obj_throw)
		}
	}; break;
}

if (current_health == 0) {
	current_state = BOSS_STATES.dead
}