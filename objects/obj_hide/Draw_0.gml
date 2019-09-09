draw_set_colour(ELEMENT_COLOUR_2);

draw_sprite_ext(spr_square, !grid[# 0, 0], x, y, cell_w/60, cell_h/60, 0, ELEMENT_COLOUR_2, 1.0);

draw_set_colour(c_white);

if (!first_click)
{
    var _d = lerp(0, -20, 0.5+0.5*dsin(current_time/7));
    draw_set_colour(ELEMENT_COLOUR_3);
    draw_triangle(x-32 + _d, y, x-32 + _d, y+40, x + _d, y+20, false);
    draw_triangle(x, y-32 + _d, x+40, y-32 + _d, x+20, y + _d, false);
    draw_set_colour(c_white);
}

if (!first_click || !grid[# 0, 0])
{
    draw_set_colour(ELEMENT_COLOUR_2);
    draw_set_font(fnt_default);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(room_width/2, room_height-10, "juju adams & jing tan");
    draw_set_colour(c_white);
}