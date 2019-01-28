darkness = lerp(darkness, target_darkness, fade_speed)

if (keyboard_check_pressed(ord("P"))) {
	game_restart()
}

if (global.can_create_new_event) {
	
	if (global.current_event_interactable != noone) {
		if (global.current_event_interactable.boss == true) {
			global.current_event_interactable.current_state = INTERACTABLE_STATES.bright
		} else {
			global.current_event_interactable.current_state = INTERACTABLE_STATES.dark
		}
	}
	
	if (global.current_event < level_properties[global.current_level, 0]) {
		
		// CREATE NEW EVENT
		random_interactable()
		
	} else {
		
		// CREATE BOSS
		level_properties[global.current_level, 1].current_state = INTERACTABLE_STATES.scary
		global.current_event_interactable = level_properties[global.current_level, 1]
		
/*		var pool = array_length_1d(global.interactables)-1
var index = round(random(pool))
global.interactables[index].current_state = INTERACTABLE_STATES.scary
global.current_event_interactable = global.interactables[index]*/
		
	}
	global.current_event += 1
	global.can_create_new_event = false
}