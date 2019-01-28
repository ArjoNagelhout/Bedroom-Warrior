
// MOVEMENT
hsp = 0
vsp = 0

target_hsp = 0
target_vsp = 0

max_speed = 4
_friction = 0.1


// LOGIC
move = true
sleep = true


// CAMERA
camera_speed = 0.1
camera_x = x
camera_y = y
camera_tx = x
camera_ty = y

camera_width = 500
camera_height = 500

camera = camera_create()
var viewmat = matrix_build_lookat(x, y, -100, x, y, 0, 0, 1, 0)
var projmat = matrix_build_projection_ortho(camera_width, camera_height, 1.0, 32000.0)

camera_set_view_mat(camera, viewmat)
camera_set_proj_mat(camera, projmat)

view_camera[0] = camera;