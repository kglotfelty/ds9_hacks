ttk::frame $ds9(main).hack.quick.imgstuff
#~ grid $ds9(main).hack.quick.imgstuff -row 0 -column $atcol -padx 5
pack $ds9(main).hack.quick.imgstuff -padx 5 -side left
incr atcol
ttk::button $ds9(main).hack.quick.imgstuff.smth -text {S} -takefocus 0 -command {ds9Cmd "-smooth"} \
   -image [image create photo -file "$ds9_hack_root/UI/smooth.png"]
ttk::button $ds9(main).hack.quick.imgstuff.cntr -text {C} -takefocus 0 -command {ds9Cmd "-contour"} \
   -image [image create photo -file "$ds9_hack_root/UI/contour.png"]
ttk::button  $ds9(main).hack.quick.imgstuff.wcs -text {WCS} -takefocus 0 -command {ds9Cmd "-match frame wcs" } \
   -image [image create photo -file "$ds9_hack_root/UI/match.png"]
ttk::button  $ds9(main).hack.quick.imgstuff.cgrid -text {Coordinate Grid} -takefocus 0 -command {ds9Cmd "-grid yes" } \
   -image [image create photo -file "$ds9_hack_root/UI/coord_grid.png"]

grid $ds9(main).hack.quick.imgstuff.smth -row 0 -column 0 
grid $ds9(main).hack.quick.imgstuff.cntr -row 0 -column 1 
grid $ds9(main).hack.quick.imgstuff.cgrid -row 0 -column 2 
grid $ds9(main).hack.quick.imgstuff.wcs  -row 0 -column 3
