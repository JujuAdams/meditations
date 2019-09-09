surface = -1;


metaball_max_count = 30;
metaball_max       = -1;

metaball_stack = ds_priority_create();

metaball_x      = array_create(metaball_max_count, -1000);
metaball_y      = array_create(metaball_max_count, -1000);
metaball_vx     = array_create(metaball_max_count, 0);
metaball_vy     = array_create(metaball_max_count, 0);
metaball_colour = array_create(metaball_max_count, c_black);
metaball_alpha  = array_create(metaball_max_count, 0.0);

var _i = 0;
repeat(metaball_max_count)
{
    ds_priority_add(metaball_stack, _i, _i);
    ++_i;
}