
global regionshape_icons
set regionshape_icons [ list [image create photo -file "$ds9_hack_root/UI/circle.png"] \
                             [image create photo -file "$ds9_hack_root/UI/annulus.png"] \
                             [image create photo -file "$ds9_hack_root/UI/ellipse.png"] \
                             [image create photo -file "$ds9_hack_root/UI/box.png"] \
                             [image create photo -file "$ds9_hack_root/UI/poly.png"] \
                             [image create photo -file "$ds9_hack_root/UI/text.png"] \
                             [image create photo -file "$ds9_hack_root/UI/region_other.png"] \
                            ]


proc my_change_marker { newval iswhat } {
  global marker
  global ds9
  global regionshape_icons

  if { $iswhat != "other" } {
    set marker(shape) $iswhat
  }

  $ds9(main).hack_left.shapes.at configure -text $newval \
  -image [lindex $regionshape_icons $newval]

}


ttk::frame $ds9(main).hack_left.shapes 
pack $ds9(main).hack_left.shapes -side top

ttk::menubutton $ds9(main).hack_left.shapes.at -menu $ds9(main).hack_left.shapes.at.m \
  -text "Region Shapes" -direction right \
  -image [lindex $regionshape_icons 0] -takefocus 0

global marker
set marker(shape) "circle"
  
menu $ds9(main).hack_left.shapes.at.m -tearoff 0

$ds9(main).hack_left.shapes.at.m add command -label [msgcat::mc {Circle}] \
    -command "my_change_marker 0 circle" \
    -image [lindex $regionshape_icons 0] -compound left

$ds9(main).hack_left.shapes.at.m add command -label [msgcat::mc {Annulus}] \
    -command "my_change_marker 1 annulus" \
    -image [lindex $regionshape_icons 1] -compound left

$ds9(main).hack_left.shapes.at.m add command -label [msgcat::mc {Ellipse}] \
    -command "my_change_marker 2 ellipse" \
    -image [lindex $regionshape_icons 2] -compound left

$ds9(main).hack_left.shapes.at.m add command -label [msgcat::mc {Box}] \
    -command "my_change_marker 3 box" \
    -image [lindex $regionshape_icons 3] -compound left

$ds9(main).hack_left.shapes.at.m add command -label [msgcat::mc {Polygon}] \
    -command "my_change_marker 4 polygon" \
    -image [lindex $regionshape_icons 4] -compound left

$ds9(main).hack_left.shapes.at.m add command -label [msgcat::mc {Text}] \
    -command "my_change_marker 5 text" \
    -image [lindex $regionshape_icons 5] -compound left

pack $ds9(main).hack_left.shapes.at -side top


ttk::button $ds9(main).hack_left.shapes.info -text {Region Info} \
    -takefocus 0 -command {ds9Cmd "-region getinfo"} \
    -image [image create photo -file "$ds9_hack_root/UI/region_info.png"] 

ttk::button $ds9(main).hack_left.shapes.list -text {Region List} \
    -takefocus 0 -command {ds9Cmd "-region list"} \
    -image [image create photo -file "$ds9_hack_root/UI/region_list.png"] 
    

ttk::button $ds9(main).hack_left.shapes.open -text {Region Open} \
    -takefocus 0 -command MarkerLoad \
    -image [image create photo -file "$ds9_hack_root/UI/region_open.png"] 
ttk::button $ds9(main).hack_left.shapes.save -text {Region Save} \
    -takefocus 0 -command [list MarkerSave {}] \
    -image [image create photo -file "$ds9_hack_root/UI/region_save.png"] 


pack $ds9(main).hack_left.shapes.info -side top -fill x
pack $ds9(main).hack_left.shapes.list -side top -fill x 
pack $ds9(main).hack_left.shapes.open -side top -fill x 
pack $ds9(main).hack_left.shapes.save -side top -fill x 

global marker

trace add variable marker(shape) write "sync_region_shape"

proc sync_region_shape {name1 name2 op} {
    global marker

    switch $marker(shape) {
        circle       {my_change_marker 0 $marker(shape)}
        annulus      {my_change_marker 1 $marker(shape)}
        ellipse      {my_change_marker 2 $marker(shape)}
        box          {my_change_marker 3 $marker(shape)}
        polygon      {my_change_marker 4 $marker(shape)}
        text         {my_change_marker 5 $marker(shape)}
        default      {my_change_marker 6 other}
    }


}




