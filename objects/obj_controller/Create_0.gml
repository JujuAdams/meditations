//The audio came out a little quiet, and we didn't have time to re-export it
audio_master_gain(1.5);

//GM freaks out in HTML5 if you don't set a default font
draw_set_font(fnt_default);

//This controls how often the synth/chord objects are updated
step_time = current_time;

//The current chord we're playing
//There are four total
global.chord = 0;

//Lookup table for the synth sfx
//The synth was made in Reason 5.0 and all delay/reverb is baked
global.pluck_lookup[ 0] = juju_synth_0;
global.pluck_lookup[ 1] = juju_synth_1;
global.pluck_lookup[ 2] = juju_synth_2;
global.pluck_lookup[ 3] = juju_synth_3;
global.pluck_lookup[ 4] = juju_synth_4;
global.pluck_lookup[ 5] = juju_synth_5;
global.pluck_lookup[ 6] = juju_synth_6;
global.pluck_lookup[ 7] = juju_synth_7;
global.pluck_lookup[ 8] = juju_synth_8;
global.pluck_lookup[ 9] = juju_synth_9;
global.pluck_lookup[10] = juju_synth_10;
global.pluck_lookup[11] = juju_synth_11;
global.pluck_lookup[12] = juju_synth_12;
global.pluck_lookup[13] = juju_synth_13;
global.pluck_lookup[14] = juju_synth_14;
global.pluck_lookup[15] = juju_synth_15;
global.pluck_lookup[16] = juju_synth_16;
global.pluck_lookup[17] = juju_synth_17;
global.pluck_lookup[18] = juju_synth_18;
global.pluck_lookup[19] = juju_synth_19;
global.pluck_lookup[20] = juju_synth_20;