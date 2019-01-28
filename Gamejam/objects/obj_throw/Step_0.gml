vsp += _gravity

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
	vsp *= -bounce
}

rotation = rot_speed * vsp + flip*180

// TIMER
if (deadly_timer > 0) {
	deadly_timer -= 1
}