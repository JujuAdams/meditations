if (obj_hide.grid[# 0, 0]) exit;

var _grid_x = floor((mouse_x - x) / (cell_w + sep_w));
var _grid_y = floor((mouse_y - y) / (cell_h + sep_h));

if ((_grid_x >= 0)
&&  (_grid_y >= 0)
&&  (_grid_x < ds_grid_width(grid))
&&  (_grid_y < ds_grid_height(grid)))
{
    if (mouse_check_button_pressed(mb_left))
    {
        grid[# _grid_x, _grid_y] = (grid[# _grid_x, _grid_y] + 1) mod 3;
    }
    
    if (mouse_check_button_pressed(mb_right))
    {
        grid[# _grid_x, _grid_y] = 0;
    }
}