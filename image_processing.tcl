frame $ds9(main).quick.imgstuff
grid $ds9(main).quick.imgstuff -row 0 -column $atcol -padx 5
incr atcol
button $ds9(main).quick.imgstuff.smth -text {S} -takefocus 0 -command {ds9Cmd "-smooth"} \
   -image [image create photo -file "$ds9_hack_root/UI/smooth.png"]
button $ds9(main).quick.imgstuff.cntr -text {C} -takefocus 0 -command {ds9Cmd "-contour"} \
   -image [image create photo -file "$ds9_hack_root/UI/contour.png"]
button  $ds9(main).quick.imgstuff.wcs -text {WCS} -takefocus 0 -command {ds9Cmd "-match frames wcs" } \
   -image [image create photo -file "$ds9_hack_root/UI/match.png"]

grid $ds9(main).quick.imgstuff.smth -row 0 -column 0 
grid $ds9(main).quick.imgstuff.cntr -row 0 -column 1 
grid $ds9(main).quick.imgstuff.wcs  -row 0 -column 2