// Everything that needs to be done once

global.pixel_font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ.!", true, 1)

darkness = 1
fade_speed = 0.01
target_darkness = 1

// LEVELS
/* 

[amount of random events, boss object]


*/
global.current_level = 0
global.current_event = 0
global.can_create_new_event = true
global.interactables = noone
global.current_event_interactable = noone

level_properties[0, 0] = 1
level_properties[0, 1] = obj_boss_closet

level_properties[1, 0] = 2
level_properties[1, 1] = obj_boss_toybox

level_properties[2, 0] = 2
level_properties[2, 1] = obj_boss_painting

// STATES

enum BOSS_STATES {
    start,
	throw,
	vulnerable,
	hit,
	dead
}

enum INTERACTABLE_STATES {
	dark,
	bright,
	scary
}

// AUDIO
audio_play_sound(mus_main, 0, true)

// FULLY LOADED, GOTO FIRST ROOM

room_goto(room_main)