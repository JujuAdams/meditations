grid = ds_grid_create(9, 9);
grid_next = ds_grid_create(9, 9);
trigger_list = ds_list_create();

//Initial synth state
//This should play something pretty I hope!
grid[# 4, 1] = 2;
grid[# 3, 3] = 2;
grid[# 6, 4] = 2;
grid[# 6, 6] = 8;
grid[# 4, 7] = 1;

step = 0;
step_speed = 1;

cell_w  = 60;
cell_h  = 60;
sep_w   =  3;
sep_h   =  3;
total_w = ds_grid_width(grid) *cell_w + (ds_grid_width(grid) -1)*sep_w;
total_h = ds_grid_height(grid)*cell_h + (ds_grid_height(grid)-1)*sep_h;
scale   = 1;

first_click = false;