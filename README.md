<h1 align="center">A Message from Amalthea</h1>

### @jujuadams and @Spiderlily666

Music toy made for the 2019 Meditations project (9th September). Designed to run in the browser on multiple platforms.

*Please note that this repo and its contents are licensed as **All Rights Reserved**. You may learn from this project but not repurpose its art assets, audio, or code.*

&nbsp;

**Code, design:** [Juju Adams](https://twitter.com/jujuadams)

**Audio, design:** [Jing Chun Tan](https://twitter.com/Spiderlily666)

*Inspired by Otomata: https://earslap.com/page/otomata.html*

Juju and Jing would like to thank [Jupiter Hadley](https://twitter.com/jupiter_hadley) and [Quang Nguyen](https://twitter.com/asobitech/) for their help with this small project, and their endless, selfless support of developers around the globe.

&nbsp;

This simple music toy was written in the space of a few days in early September 2019. The game is designed to be run from the browser using HTML5, but it should run ok on Windows and Mac (and probably other platforms too). There's nothing especially clever in here. Juju neatened up the code after release so it's a bit easier to read, but this is basically the final release version of the game. Please DM Juju on Twitter or send an email to contact@jujuadams.com if you'd like to get in touch.

The most complex part of this system is [synth_step()](https://github.com/JujuAdams/meditations/blob/master/scripts/synth_step/synth_step.gml) which handles how arrows move around on the grid. Performance is always a concern when writing cross-platform code so Juju decided to take a slightly unusual route with the metaballs; the metaballs themselves are handled as values in a handful of arrays. Otherwise, this is standard GML with no surprises.

&nbsp;

"Amalthea, the third moon of Jupiter, was discovered on September 9th 1892 by a human called Edward Barnard. It is one of an incalculable number of gigantic irregular rocks that scatter the Universe. Barnard's birthplace - Earth - was at that time preoccupied with hosting sentient mlife, though neither the planet nor the species on it ever had much luck communicating. Amalthea watched Earth and, as is often the case for gigantic irregular rocks, felt lonely.

Barnard later discovered a star. The star itself had always known it had existed, and wasn't mbothered about being discovered by a spec of thinking carbon 6 lightyears away. It was a red dwarf and had much more important things to think about, such as trying very hard to not run out of hydrogen.

The star was eventually named "Barnard's Star", which is predictably unimaginative. However, Amalthea liked her name - a caring mother who raised a young Jupiter, God of gods, the very planet she found herself orbiting. Having a name made Amalthea feel less alone. She hoped the humans would get in touch soon. She was sure they'd love to pop round for tea, and meet the sentient life evolving under her icecaps."
