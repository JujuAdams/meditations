if (!surface_exists(surface))
{
    surface = surface_create(room_width/METABALL_SURFACE_SCALE, room_height/METABALL_SURFACE_SCALE);
}

var _magnet_x, _magnet_y;

var _radius = lerp(100, 200, 0.5 + 0.5*dsin(current_time/50));
_magnet_x[0] = lengthdir_x(_radius, current_time/30) + room_width/2;
_magnet_y[0] = lengthdir_y(_radius, current_time/30) + room_height/2;

var _radius = lerp(0, 100, 0.5 + 0.5*dsin(current_time/70));
_magnet_x[1] = lengthdir_x(_radius, -current_time/17) + room_width/2;
_magnet_y[1] = lengthdir_y(_radius, -current_time/17) + room_height/2;

surface_set_target(surface);
draw_clear_alpha(c_black, 0.0);

gpu_set_blendmode(bm_add);

var _i = 0;
repeat(metaball_max_count)
{
    var _alpha = metaball_alpha[_i];
    if (_alpha <= 0.0)
    {
        ++_i;
        continue;
    }
    
    var _x  = metaball_x[ _i];
    var _y  = metaball_y[ _i];
    var _vx = metaball_vx[_i];
    var _vy = metaball_vy[_i];
    
    //Attractive force to the centre of the screen
    //var _m = _i mod 2;
    //var _dx = _magnet_x[_m] - _x;
    //var _dy = _magnet_y[_m] - _y;
    //var _d  = sqrt(_dx*_dx + _dy*_dy);
    //if (_d > 100)
    //{
    //    _d = 0.1/_d;
    //    _vx += _dx*_d;
    //    _vy += _dy*_d;
    //}
    
    //var _j = _i;
    //repeat(metaball_max - _i)
    //{
    //    if (metaball_alpha[_j] <= 0.0)
    //    {
    //        ++_j;
    //        continue;
    //    }
    //    
    //    var _other_x = metaball_x[_j];
    //    var _other_y = metaball_y[_j];
    //    
    //    var _dx = _other_x - _x;
    //    var _dy = _other_y - _y;
    //    var _d  = _dx*_dx + _dy*_dy;
    //    
    //    if (_d != 0)
    //    {
    //        _d = 1/_d;
    //        _dx *= _d;
    //        _dy *= _d;
    //        
    //        _vx += _dx;
    //        _vy += _dy;
    //        metaball_x[@ _j] -= _dx;
    //        metaball_y[@ _j] -= _dy;
    //    }
    //    
    //    ++_j;
    //}
    
    //_vx *= 0.95;
    //_vy *= 0.95;
    _x  += _vx;
    _y  += _vy;
    
    _alpha -= 0.0005;
    
    if ((_x < -MAX_RADIUS) || (_y < -MAX_RADIUS) || (_x > room_width+MAX_RADIUS) || (_y > room_height+MAX_RADIUS) || (_alpha <= 0.0))
    {
        metaball_delete(_i);
    }
    else
    {
        metaball_x[@     _i] = _x;
        metaball_y[@     _i] = _y;
        metaball_vx[@    _i] = _vx;
        metaball_vy[@    _i] = _vy;
        metaball_alpha[@ _i] = _alpha;
        
        draw_sprite_ext(spr_metaball, 0, _x/METABALL_SURFACE_SCALE, _y/METABALL_SURFACE_SCALE, 1.5/METABALL_SURFACE_SCALE, 1.5/METABALL_SURFACE_SCALE, 0, metaball_colour[_i], metaball_alpha[_i]);
        draw_sprite_ext(spr_metaball, 0, _x/METABALL_SURFACE_SCALE, _y/METABALL_SURFACE_SCALE, 2/METABALL_SURFACE_SCALE, 2/METABALL_SURFACE_SCALE, 0, metaball_colour[_i], 0.1*metaball_alpha[_i]);
    }
    
    ++_i;
}

gpu_set_blendmode(bm_normal);
draw_set_colour(c_white);
draw_set_alpha(1.0);
surface_reset_target();

shader_set(shd_metaball);
draw_surface_ext(surface, 0, 0, METABALL_SURFACE_SCALE, METABALL_SURFACE_SCALE, 0, c_white, 1.0);
shader_reset();