/// @param index

var _index = argument0;

with(obj_metaballs)
{
    ds_priority_add(metaball_stack, _index, _index);
    metaball_alpha[@ _index] = 0.0;
    metaball_x[@     _index] = -1000;
    metaball_y[@     _index] = -1000;
    
    //if (_index == metaball_max)
    //{
    //    var _i = _index-1;
    //    repeat(_index)
    //    {
    //        if (metaball_colour[_i] > 0.0) break;
    //        --_i;
    //    }
    //    
    //    metaball_max = _i;
    //}
}