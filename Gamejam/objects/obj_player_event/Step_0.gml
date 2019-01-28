// MOVEMENT

key_jump = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space))
key_jump_hold = (keyboard_check(vk_up) || keyboard_check(ord("W")) || keyboard_check(vk_space))
key_left = (keyboard_check(vk_left) || keyboard_check(ord("A")))
key_right = (keyboard_check(vk_right) || keyboard_check(ord("D")))




var corrected_speed = max_speed
var corrected_jspeed = jump_speed
if (holding_throwable) {
	corrected_speed *= holding_h
	corrected_jspeed *= holding_jump
}

target_hsp = (-key_left + key_right)*corrected_speed

hsp = lerp(hsp, target_hsp, _friction)


if (place_meeting(x, y+1, obj_solid)) {
	vsp = -corrected_jspeed*key_jump
}


vsp += _gravity


if !(place_meeting(x+hsp, y, obj_solid)) && !(place_meeting(x+hsp, y, obj_barrier)) {
	x += hsp
} else {
	while !(place_meeting(x+sign(hsp), y, obj_solid)) && !(place_meeting(x+sign(hsp), y, obj_barrier)) {
		x += sign(hsp)
	}
	hsp = 0
}

if !(place_meeting(x, y+vsp, obj_solid)) {
	y += vsp
} else {
	while !(place_meeting(x, y+sign(vsp), obj_solid)) {
		y += sign(vsp)
	}
	vsp = 0
}

// THROWABLE LOGIC
key_action = (keyboard_check_pressed(ord("E")))
key_action_hold = (keyboard_check(ord("E")))
key_action_release = (keyboard_check_released(ord("E")))
var grab_object = instance_nearest(x,y,obj_throw)
distance = distance_to_object(grab_object)

if (holding_throwable) {
	if (place_meeting(x, y+holding_offset, obj_solid)) || (place_meeting(x, y+holding_offset, obj_throw)) {
		holding_throwable = false
		can_grab = false
		alarm[0] = grab_delay
		var throw_instance = instance_create_depth(x, y+holding_offset, -10, obj_boss.throw_object)
		throw_instance.flip = true
	}
	
	if (key_action_hold && alarm[0] == -1) {
		anticipation += anticipation_speed
	}
	
	if (key_action_release && alarm[0] == -1) {
		holding_throwable = false
		can_grab = false
		alarm[0] = grab_delay
		throwable = instance_create_depth(x, y+holding_offset, -10, obj_boss.throw_object)
		var throw_speed = (anticipation/max_anticipation)*max_throw_speed
		with (throwable) {
			flip = true
			hsp = throw_speed
			vsp = -throw_speed
			deadly_timer = obj_player_event.throw_deadly_delay
		}
		anticipation = 0
	}
	
} else {
	anticipation = 0
	
	if (key_action && can_grab) {
		can_grab = false
		alarm[0] = grab_delay
		
		if (distance > min_distance) {
			if (distance < max_distance) {
				throwable_x = grab_object.x
				throwable_y = grab_object.y
				throwable_rot = grab_object.rotation
				
				with (grab_object) {
					instance_destroy()
				}
				holding_throwable = true
			}
		}
	}
}

if (place_meeting(x, y, obj_throw)) {
	if (instance_nearest(x,y,obj_throw).deadly_timer == 0) {
		room_restart()
	}
}

throwable_x = lerp(throwable_x, x-anticipation, 1/grab_speed)
throwable_y = lerp(throwable_y, y+anticipation+holding_offset, 1/grab_speed)
throwable_rot = lerp(throwable_rot, 0, 1/grab_speed)


image_speed = hsp/max_speed