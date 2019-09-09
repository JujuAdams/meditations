var _hue = 32 + choose(0, 128) + global.chord*64 + random(40);
return make_colour_hsv(_hue mod 256, 210, 255);