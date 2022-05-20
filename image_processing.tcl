

ttk::frame $ds9(main).hack_top.imgstuff
pack $ds9(main).hack_top.imgstuff -padx 5 -side left

ttk::button $ds9(main).hack_top.imgstuff.smth -text {S} -takefocus 0 -command {toggle_smooth} \
   -image [image create photo -file "$ds9_hack_root/UI/smooth.png"]
ttk::button $ds9(main).hack_top.imgstuff.cntr -text {C} -takefocus 0 -command {toggle_contour} \
   -image [image create photo -file "$ds9_hack_root/UI/contour.png"]
ttk::button  $ds9(main).hack_top.imgstuff.wcs -text {WCS} -takefocus 0 -command {ds9Cmd "-match frame wcs" } \
   -image [image create photo -file "$ds9_hack_root/UI/match.png"]
ttk::button  $ds9(main).hack_top.imgstuff.cgrid -text {Coordinate Grid} -takefocus 0 -command {toggle_grid} \
   -image [image create photo -file "$ds9_hack_root/UI/coord_grid.png"]

pack $ds9(main).hack_top.imgstuff.smth -side left
pack $ds9(main).hack_top.imgstuff.cntr -side left
pack $ds9(main).hack_top.imgstuff.cgrid -side left
pack $ds9(main).hack_top.imgstuff.wcs -side left

proc toggle_smooth { } {
  global current
  global smooth
  
  if { [$current(frame) has smooth ] } {
      set smooth(view) 0
  } else {
      set smooth(view) 1      
  }

  SmoothUpdate
}

proc toggle_contour { } {
  global contour
  global current
  
  if { [$current(frame) has contour] } {
    set contour(view) 0
  } else {
    set contour(view) 1      
  }
    
  UpdateContour    
    
}

proc toggle_grid { } {
    global current
    global grid
    
    if { [$current(frame) has grid] } {
        set grid(view) 0
    } else {
        set grid(view) 1        
    }
    
    GridUpdateCurrent
    
}
