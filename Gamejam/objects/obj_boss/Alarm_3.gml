/// @description throw interval

var new_throw = instance_create_depth(x+spawn_x, y+spawn_y, -10, throw_object)
with new_throw {
	deadly_timer = obj_player_event.throw_deadly_delay
}