if (obj_hide.grid[# 0, 0]) exit;

if (scale != 1)
{
    var _matrix = matrix_build(-total_w/2, -total_h/2, 0,   0, 0, 0,   1, 1, 1);
    _matrix = matrix_multiply(_matrix, matrix_build(0, 0, 0,   0, 0, 0,   1, 1, 1));
    _matrix = matrix_multiply(_matrix, matrix_build(x + total_w/2, y + total_h/2, 0,   0, 0, 0,   1, 1, 1));
    matrix_set(matrix_world, _matrix);
}
else
{
    matrix_set(matrix_world, matrix_build(x, y, 0,   0, 0, 0,   1, 1, 1));
}

var _half_w = cell_w/2;
var _half_h = cell_h/2;
var _full_w = cell_w + sep_w;
var _full_h = cell_h + sep_h;

var _grid_y = 0;
repeat(ds_grid_height(grid))
{
    var _grid_x = 0;
    repeat(ds_grid_width(grid))
    {
        var _l = _grid_x*_full_w;
        var _t = _grid_y*_full_h;
        
        draw_sprite_ext(spr_square, 1, _l, _t, 1, 1, 0, ELEMENT_COLOUR_0, 1.0);
        
        var _value = grid[# _grid_x, _grid_y];
        
        if (_value & 1) draw_sprite_ext(spr_triangle, 0, _l + _half_w, _t + _half_h, 1, 1,   0, ELEMENT_COLOUR_2, 1.0);
        if (_value & 2) draw_sprite_ext(spr_triangle, 0, _l + _half_w, _t + _half_h, 1, 1,  90, ELEMENT_COLOUR_2, 1.0);
        if (_value & 4) draw_sprite_ext(spr_triangle, 0, _l + _half_w, _t + _half_h, 1, 1, 180, ELEMENT_COLOUR_2, 1.0);
        if (_value & 8) draw_sprite_ext(spr_triangle, 0, _l + _half_w, _t + _half_h, 1, 1, 270, ELEMENT_COLOUR_2, 1.0);
        draw_set_colour(c_white);
        
        ++_grid_x;
    }
    
    ++_grid_y;
}

//draw_rectangle(0, 0, total_w, total_h, true);

if (!first_click && !obj_play.grid[# 0, 0])
{
    var _l = 2*_full_w;
    var _t = 4*_full_h;
    
    var _d = lerp(5, 20, 0.5+0.5*dsin(current_time/7));
    draw_set_colour(ELEMENT_COLOUR_3);
    draw_triangle(_l-20 - _d, _t+10, _l-20 - _d, _t+50, _l - _d, _t+30, false);
    draw_triangle(_l+10, _t-20 - _d, _l+50, _t-20 - _d, _l+30, _t - _d, false);
    draw_triangle(_l+cell_w+20 + _d, _t+10, _l+cell_w+20 + _d, _t+50, _l+cell_w + _d, _t+30, false);
    draw_triangle(_l+10, _t+cell_h+20 + _d, _l+50, _t+cell_h+20 + _d, _l+30, _t+cell_h + _d, false);
    draw_set_colour(c_white);
}

matrix_set(matrix_world, matrix_build_identity());