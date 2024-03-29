# Customizing SAOImageDS9

![ds9_ui.png](doc/ds9_ui.png)


The [SAOImage ds9](http://ds9.si.edu) 
application, aka [`ds9`](https://github.com/SAOImageDS9/SAOImageDS9), 
is the premiere image display tool for 
professional and amateur astronomers world wide.

It is a powerful display tool for all common types of astrophysical data
and provides a rich set of features unavailable other packages.

It is also highly flexible and configurable (ie _hackable_) for individual 
users' needs.  In fact it was designed and built with that level of 
flexibility in mind.

This repro contains some (only some) of my own personal ds9 hacks. 
It contains code to

1. Generate a new button bar, with icons(!), for access to many common 
   tasks such as changing region shape, color, thickness, dashes, properties.
   It also makes it each to switch image scaling (log, linear, sqrt)
   and provides quick access to smoothing, contours, and frame matching.

2. Includes new color maps (look up tables, LUT) adapted from 
   the [ImageJ](https://imagej.nih.gov/ij/) and 
   [XImage](https://heasarc.gsfc.nasa.gov/xanadu/ximage/ximage.html)
   projects.  The new colors lookup tables use icons instead of names 
   in new sub-menus.
   

## Quick start

```bash
cd $HOME

git clone https://github.com/kglotfelty/ds9_hacks/
ln -s $HOME/ds9_hacks/.ds9.ini ./
```

You can move the `ds9_hacks` directory to whatever location you want; 
you just need to modify the `.ds9.ini` file to point to it.  

```tcl
set ds9_hack_root "$env(HOME)/ds9_hacks"
```

You will also need to modify the `region_dash.tcl` to point to the new location.


## How does it work?


Under the hood, the `ds9` user interface (GUI) is written in [`Tcl/Tk`](https://www.tcl.tk/) 
(pronounced _tickle tee kay_).  `ds9` was originally developed as a demonstration of a 
set of `Tcl/Tk`  widgets as discussed in
[SAOTk: Tcl/Tk Widgets for Imaging and Data Visualization](http://www.adass.org/adass/proceedings/adass98/joyew/).

It was built on top of a set of modular components and meant to be easily
adaptable.  There are various entry points into the application.  The
one used by this set of hacks is the [`.ds9.ini`](http://ds9.si.edu/doc/ref/file.html#StartupFile) file.

The `$HOME/.ds9.ini` file is automatically loaded by `ds9` when it starts.  It is
a `Tcl/Tk` script which can do whatever the user desires.  The
version of the script in this repro loads the other scripts to create the various buttons,
loads the new color lookup tables, and adds new analysis tasks.

![design.png](doc/design.png)

### Buttons

The buttons are created using a set of `Tcl/Tk` scripts.  Each of the scripts 
creates a set of buttons:

![ds9_buttons.png](doc/ds9_buttons.png)


Each of the scripts has comments describing how, in general, it works.  
For specific `ds9` functions, you will need to go diving into the 
`ds9` source code.


#### The `ds9Cmd` command

One of the key elements of these scripts is the use of the `ds9Cmd` command.
I do not believe it is actually documented anywhere, but the jist is that
it takes a string argument which is parsed the same way the `ds9` command line
arguments are parsed.  So anything that can be done on the command line 
can be done using the `ds9Cmd` command.  


### Color Maps

The color maps are loaded via the `extra_lut.tcl` script.  That script
includes a modified version of the original `ds9` `load_color_map` routine
which 

- places the new LUTs in their own sub-menu.
- add icons for the color maps 

The _XImage_ and _ImageJ_ LUTs are taken from public domain software package.  
I have many more LUTs in my own personal collection but they require 
different licensing that I'd rather not deal with.  I have provided the
full set of these LUTs but the scripts only load a subset.  


## Versions

These hacks are done at a low level within the code.  As such, they may
not work with each and every version of `ds9`.  They also may break
in unexpected way.  For example, there is a known issue that the
new button bar does not display correctly when the user switches to the
`Vertical Orientation` layout.

No support is given.  Your results may vary.  This work is not 
in any way connected with the `SAOImageDS9` project, it's sponsors, 
nor anything related to my day job.   All opinions, comments, text, etc are
mine alone.

## Not alone

I am **NOT** the first person to come up with these kinds of `ds9` hacks.
Users around the globe have been tweaking the interface, adding
their own custom analysis menu commands, and setting up live
real-time displays for years.  For example 
[Extending and Customising DS9](https://ui.adsabs.harvard.edu/abs/2005ASPC..347..114C/abstract),
Clark, Allen, and Joye.  










