if (obj_hide.grid[# 0, 0]) exit;

matrix_set(matrix_world, matrix_build(x, y, 0,   0, 0, 0,   1, 1, 1));

var _scale = min(cell_w/60, cell_h/60);

var _grid_y = 0;
repeat(ds_grid_height(grid))
{
    var _grid_x = 0;
    repeat(ds_grid_width(grid))
    {
        var _l = _grid_x*(cell_w + sep_w);
        var _t = _grid_y*(cell_h + sep_h);
        
        if (_grid_x == position)
        {
            var _colour_a = ELEMENT_COLOUR_2;
            var _colour_b = ELEMENT_COLOUR_0;
        }
        else
        {
            var _colour_a = ELEMENT_COLOUR_0;
            var _colour_b = ELEMENT_COLOUR_2;
        }
        
        draw_sprite_ext(spr_square, 1, _l, _t, cell_w/60, cell_h/60, 0, _colour_a, 1.0);
        
        var _value = grid[# _grid_x, _grid_y];
        if (_value == 1) draw_sprite_ext(spr_triangle, 0, _l + cell_w/2, _t + cell_h/2, _scale, _scale, 270, _colour_b, 1.0);
        if (_value == 2) draw_sprite_ext(spr_triangle, 0, _l + cell_w/2, _t + cell_h/2, _scale, _scale,  90, _colour_b, 1.0);
        
        ++_grid_x;
    }
    
    ++_grid_y;
}

for(var _i = 0; _i < 4; ++_i)
{
    if (_i == global.chord)
    {
        draw_set_colour(ELEMENT_COLOUR_3);
    }
    else
    {
        draw_set_colour(ELEMENT_COLOUR_1);
    }
    draw_circle(-10, _i*9, 4, false);
}
draw_set_colour(c_white);

matrix_set(matrix_world, matrix_build_identity());