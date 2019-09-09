/// @param x
/// @param y
/// @param speed
/// @param direction
/// @param colour
/// @param alpha

with(obj_metaballs)
{
    if (!ds_priority_empty(metaball_stack))
    {
        var _index = ds_priority_delete_min(metaball_stack);
        metaball_max = max(metaball_max, _index);
        
        metaball_x[@      _index] = argument0;
        metaball_y[@      _index] = argument1;
        metaball_vx[@     _index] = lengthdir_x(argument2, argument3);
        metaball_vy[@     _index] = lengthdir_y(argument2, argument3);
        metaball_colour[@ _index] = argument4;
        metaball_alpha[@  _index] = argument5;
    }
}