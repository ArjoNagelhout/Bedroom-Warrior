x_slider = x
y_slider = y

angle = arctan2(target_y-y, target_x-x)
max_distance = sqrt(sqr(target_x-x)+sqr(target_y-y))
distance = 0

finished = false

time_after = 80

sprite_amount = 3-1
im_index = 0