if (obj_hide.grid[# 0, 0]) exit;

draw_sprite_ext(spr_square, grid[# 0, 0], x, y, cell_w/60, cell_h/60, 0, ELEMENT_COLOUR_2, 1.0);

if (!first_click)
{
    var _d = lerp(0, 20, 0.5+0.5*dsin(current_time/7));
    draw_set_colour(ELEMENT_COLOUR_3);
    draw_triangle(x+cell_w+32 + _d, y, x+cell_w+32 + _d, y+40, x+cell_w + _d, y+20, false);
    draw_triangle(x, y+cell_h+32 + _d, x+40, y+cell_h+32 + _d, x+20, y+cell_h + _d, false);
    draw_set_colour(c_white);
}