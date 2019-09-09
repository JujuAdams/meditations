grid = ds_grid_create(12, 1);

grid[#  3, 0] = 1;
grid[#  7, 0] = 2;
grid[# 11, 0] = 1;

step = 0;
step_speed = 1/4;
position = 0;

cell_w  = 25;
cell_h  = 25;
sep_w   =  3;
sep_h   =  3;
total_w = ds_grid_width(grid) *cell_w + (ds_grid_width(grid) -1)*sep_w;
total_h = ds_grid_height(grid)*cell_h + (ds_grid_height(grid)-1)*sep_h;