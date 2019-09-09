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
        first_click = true;
        grid[# _grid_x, _grid_y] = !grid[# _grid_x, _grid_y];
    }
}

if (keyboard_check_pressed(vk_space)) grid[# 0, 0] = !grid[# 0, 0];