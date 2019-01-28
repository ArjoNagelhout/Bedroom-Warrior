// LOGIC

if (sleep) {
	move = false
} else {
	move = true
}


// CAMERA
camera_tx = clamp(x, camera_width/2, room_width-camera_width/2)
camera_ty = clamp(y, camera_height/2, room_height-camera_height/2)

camera_x = lerp(camera_x, camera_tx, camera_speed)
camera_y = lerp(camera_y, camera_ty, camera_speed)

var viewmat = matrix_build_lookat(camera_x, camera_y, -100, camera_x, camera_y, 0, 0, 1, 0)

camera_set_view_mat(camera, viewmat)



// MOVEMENT
if (move == true) {
	key_up = (keyboard_check(vk_up) || keyboard_check(ord("W")))
	key_left = (keyboard_check(vk_left) || keyboard_check(ord("A")))
	key_down = (keyboard_check(vk_down) || keyboard_check(ord("S")))
	key_right = (keyboard_check(vk_right) || keyboard_check(ord("D")))

	target_hsp = (-key_left + key_right)*max_speed
	target_vsp = (-key_up + key_down)*max_speed

	if ((target_hsp != 0) && (target_vsp != 0)) {
		target_hsp *= 0.70711
		target_vsp *= 0.70711
	}

	hsp = lerp(hsp, target_hsp, _friction)
	vsp = lerp(vsp, target_vsp, _friction)

	if !(place_meeting(x+hsp, y, obj_solid)) {
		x += hsp
	} else {
		while !(place_meeting(x+sign(hsp), y, obj_solid)) {
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
}


if (abs(round(vsp*10)) >= abs(round(hsp*10))) {
	// vertical more important
	if (round(vsp*10) >= 0) {
		sprite_index = spr_player_down
	} else {
		sprite_index = spr_player_up
	}
	image_speed = vsp/max_speed
} else {
	if (round(hsp*10) >= 0) {
		sprite_index = spr_player_right
	} else {
		sprite_index = spr_player_left
	}
	image_speed = hsp/max_speed
}

if (round(vsp*100) == 0 && round(hsp*100) == 0) {
	image_index = 0
}