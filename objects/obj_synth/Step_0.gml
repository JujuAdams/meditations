if (obj_hide.grid[# 0, 0] || obj_play.grid[# 0, 0] || !obj_play.first_click) exit;

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
        
        var _value = grid[# _grid_x, _grid_y];
        if (_value & 8)
        {
            grid[# _grid_x, _grid_y] = 0;
        }
        else if (_value & 4)
        {
            grid[# _grid_x, _grid_y] = 8;
        }
        else if (_value & 2)
        {
            grid[# _grid_x, _grid_y] = 4;
        }
        else if (_value & 1)
        {
            grid[# _grid_x, _grid_y] = 2;
        }
        else if (_value == 0)
        {
            grid[# _grid_x, _grid_y] = obj_play.grid[# 0, 0]? choose(1, 2, 4, 8) : 1;
        }
    }
    
    if (mouse_check_button_pressed(mb_right))
    {
        grid[# _grid_x, _grid_y] = 0;
    }
}