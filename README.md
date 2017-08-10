# Hacking SAOImageDS9


The [SAOImage ds9](http://ds9.si.edu) 
application, aka [`ds9`](https://github.com/SAOImageDS9/SAOImageDS9), 
is the premiere image display tool for 
professional and amateur astronomers world wide.

It is a powerful display tool for all common types of astrophysical data
and provides a rich set of features unavailable other packages.

It is also highly flexible and adaptable (ie _hackable_) for individual 
users needs.  In fact it was designed and built with that level of 
flexibility in mind.

This repro contains some (only some) of my own personal ds9 hacks. 
It contains code to

1. Generate a new button bar, with icons(!), for access to many common 
   tasks such as changing region shape, color, thickness, dashes, properties.
   It also makes it each to switch image scaling (log, linear, sqrt)
   and provides quick access to smoothing, contours, and frame matching.

2. Includes new color lookup tables adapted from the ImageJ and XImage
   projects.  The new colors lookup tables use icons instead of names 
   in the new menus.
   


## Quick start

```bash

cd $HOME

git clone https://github.com/kglotfelty/ds9_hacks/
cd ds9_hacks
ln -s $HOME/ds9_hacks/.ds9.ini ./
```

The `$HOME/.ds9.ini` file is automatically loaded by `ds9` when it starts.
This is a `Tcl/Tk` script from which any number of customizations can
be deployed.



## Versions

These hacks are done at a low level within the code.  As such, they may
not work with each and every version of `ds9`.  They also may break
in unexpected way.  For example, there is a known issue that the
new button bar does not display correctly when the user switches to the
`Vertical Orientation` layout.



## History



[SAOTk: Tcl/Tk Widgets for Imaging and Data Visualization](http://www.adass.org/adass/proceedings/adass98/joyew/)

At the time, `ds9` was only being developed as a technology demonstration 
application.  

At it's core, `ds9` was built on a highly modular architecture using 
the highly flexible [`Tcl/Tk`](https://www.tcl.tk/), _tickle tee kay_, 
scripting language and GUI.





