//Only update the synths if we're playing
if (obj_play.grid[# 0, 0])
{
    //Update every 0.4 seconds
    if (current_time - step_time > 400)
    {
        //Update the chords first
        with(obj_chords)
        {
            step += step_speed;
            if (step < 1.0) continue;
            step = 0;
            
            position = (position+1) mod ds_grid_width(grid);
            switch(grid[# position, 0])
            {
                case 1: global.chord = (global.chord + 1 + 4) mod 4; break;
                case 2: global.chord = (global.chord - 1 + 4) mod 4; break;
            }
        }
        
        //Now update the synth itself
        with(obj_synth)
        {
            var _grid_w = ds_grid_width(grid);
            var _grid_h = ds_grid_height(grid);
            
            synth_step(trigger_list);
            
            #region Play audio/create metaballs
            
            var _i = 0;
            repeat(ds_list_size(trigger_list) div 3)
            {
                var _d = trigger_list[| _i  ];
                var _x = trigger_list[| _i+1];
                var _y = trigger_list[| _i+2];
                
                switch(_d)
                {
                    case 1:
                        metaball_create(room_width + MAX_RADIUS, room_height * (_y + random_range(-0.5, 0.5))/(_grid_h-2),
                                        random_range(0.5, 1.5), random_range(135, 225),
                                        random_colour(), 1.0);
                        audio_play_sound(global.pluck_lookup[global.chord+_y], 1, false);
                    break;
                    
                    case 2:
                        metaball_create(room_width * (_x + random_range(-0.5, 0.5))/(_grid_w-2), -MAX_RADIUS,
                                        random_range(0.5, 1.5), random_range(225, 315),
                                        random_colour(), 1.0);
                        audio_play_sound(global.pluck_lookup[global.chord+_x+9], 1, false);
                    break;
                    
                    case 4:
                        metaball_create(-MAX_RADIUS, room_height * (_y + random_range(-0.5, 0.5))/(_grid_h-2),
                                        random_range(0.5, 1.5), random_range(-45, 45),
                                        random_colour(), 1.0);
                        audio_play_sound(global.pluck_lookup[global.chord+_y], 1, false);
                    break;
                    
                    case 8:
                        metaball_create(room_width * (_x + random_range(-0.5, 0.5))/(_grid_w-2), room_height + MAX_RADIUS,
                                        random_range(0.5, 1.5), random_range(45, 135),
                                        random_colour(), 1.0);
                        audio_play_sound(global.pluck_lookup[global.chord+_x+9], 1, false);
                    break;
                }
                
                _i += 3;
            }
            
            ds_list_clear(trigger_list);
            
            #endregion
        }
        
        step_time = current_time;
    }
}

//If we're in a browser, resize the canvas so it fills the whole screen
if (os_browser != browser_not_a_browser)
{
    var _aspect = room_width/room_height;
    var _display_w = display_get_width();
    var _display_h = display_get_height();
    
    if (_display_w > (_display_h*_aspect))
    {
        _display_w = floor(_display_h*_aspect);
    }
    else
    {
        _display_h = floor(_display_w/_aspect);
    }
    
    window_set_size(_display_w, _display_h);
    window_set_position((browser_width/2) - (_display_w/2), (browser_height/2) - (_display_h/2));
}