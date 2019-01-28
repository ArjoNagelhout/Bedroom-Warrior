if (global.current_level < 2) {
	room_goto(room_main)
	global.current_event = 0
	global.current_level += 1
	global.can_create_new_event = true
} else {
	room_goto(room_finish)
}