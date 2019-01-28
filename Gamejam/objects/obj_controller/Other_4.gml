/// @description FADE IN
darkness = 1
target_darkness = 0

if (room == room_main) {
	audio_resume_sound(mus_main)
	audio_stop_sound(mus_boss)
	audio_stop_sound(mus_toybox)
	audio_stop_sound(mus_dark)
} else {
	if (room != room_event_window) {
	audio_pause_sound(mus_main)}
}

if (room == room_boss_closet) || (room == room_boss_painting) {
	if !(audio_is_playing(mus_boss)) {
		audio_play_sound(mus_boss, 0, true)
	}
}

if (room == room_boss_toybox) {
	if !(audio_is_playing(mus_toybox)) {
		audio_play_sound(mus_toybox, 0, true)
	}
}

if (room == room_event_window) {
	audio_play_sound(mus_dark, 0, false)
}