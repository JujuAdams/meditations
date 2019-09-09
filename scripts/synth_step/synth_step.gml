/// @param triggerList

var _list = argument0;

step += step_speed;
if (step < 1.0) exit;
step = 0;

ds_grid_clear(grid_next, 0);

var _grid_w = ds_grid_width(grid);
var _grid_h = ds_grid_height(grid);

var _y = 0;
repeat(_grid_h)
{
    var _x = 0;
    repeat(_grid_w)
    {
        var _value = grid[# _x, _y];
        
        //        R              U + L          R + U + L          U + D             L + D           R + L + D         U + L + D       R + U + L + D
        if ((_value == 1) || (_value == 6) || (_value == 7) || (_value == 10) || (_value == 12) || (_value == 13) || (_value == 14) || (_value == 15))
        {
            if (_x == _grid_w-2)
            {
                ds_list_add(_list, 1, _x, _y);
                //var _radius = random_radius();
                //metaball_create(room_width + _radius, room_height * (_y + random_range(-0.5, 0.5))/(_grid_h-1), 0, 0, _radius, random_colour(), 1.0);
                //audio_play_sound(global.pluck_lookup[global.chord+_y], 1, false);
            }
            
            if (_x == _grid_w-1) grid_next[# _x-1, _y] |= 4 else grid_next[# _x+1, _y] |= 1;
        }
        
        //        U              R + L            R + D          R + U + D           L + D           R + L + D         U + L + D       R + U + L + D
        if ((_value == 2) || (_value == 5) || (_value == 9) || (_value == 11) || (_value == 12) || (_value == 13) || (_value == 14) || (_value == 15))
        {
            if (_y == 1)
            {
                ds_list_add(_list, 2, _x, _y);
                //var _radius = random_radius();
                //metaball_create(room_width * (_x + random_range(-0.5, 0.5))/(_grid_w-1), -_radius, 0, 0, _radius, random_colour(), 1.0);
                //audio_play_sound(global.pluck_lookup[global.chord+_x+7], 1, false);
            }
            
            if (_y == 0) grid_next[# _x, _y+1] |= 8 else grid_next[# _x, _y-1] |= 2;
        }
        
        //        L              U + D          R + U + L          R + D            U + D           R + U + D         R + L + D       R + U + L + D
        if ((_value == 4) || (_value == 3) || (_value == 7) || (_value == 9) || (_value == 10) || (_value == 11) || (_value == 13) || (_value == 15))
        {
            if (_x == 1)
            {
                ds_list_add(_list, 4, _x, _y);
                //var _radius = random_radius();
                //metaball_create(-_radius, room_height * (_y + random_range(-0.5, 0.5))/(_grid_h-1), 0, 0, _radius, random_colour(), 1.0);
                //audio_play_sound(global.pluck_lookup[global.chord+_y], 1, false);
            }
            
            if (_x == 0) grid_next[# _x+1, _y] |= 1 else grid_next[# _x-1, _y] |= 4;
        }
        
        //        D              R + U            R + L            U + L          R + U + L        R + U + D         U + L + D       R + U + L + D
        if ((_value == 8) || (_value == 3) || (_value == 5) || (_value == 6) || (_value == 7) || (_value == 11) || (_value == 14) || (_value == 15))
        {
            if (_y == _grid_h-2)
            {
                ds_list_add(_list, 8, _x, _y);
                //var _radius = random_radius();
                //metaball_create(room_width * (_x + random_range(-0.5, 0.5))/(_grid_w-1), room_height + _radius, 0, 0, _radius, random_colour(), 1.0);
                //audio_play_sound(global.pluck_lookup[global.chord+_x+7], 1, false);
            }
            
            if (_y == _grid_h-1) grid_next[# _x, _y-1] |= 2 else grid_next[# _x, _y+1] |= 8;
        }
        
        ++_x;
    }
    
    ++_y;
}

var _temp = grid_next;
grid_next = grid;
grid = _temp;

return _list;