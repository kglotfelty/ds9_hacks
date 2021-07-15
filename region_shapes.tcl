
global regionshape_icons
set regionshape_icons [ list [image create photo -file "$ds9_hack_root/UI/circle.png"] \
                             [image create photo -file "$ds9_hack_root/UI/annulus.png"] \
                             [image create photo -file "$ds9_hack_root/UI/ellipse.png"] \
                             [image create photo -file "$ds9_hack_root/UI/box.png"] \
                             [image create photo -file "$ds9_hack_root/UI/poly.png"] \
                             [image create photo -file "$ds9_hack_root/UI/text.png"] \
                            ]


proc my_change_marker { newval iswhat } {
  global marker
  global ds9
  global regionshape_icons

  set marker(shape) $iswhat
  $ds9(main).hack.quick.shapes.at configure -text $newval \
  -image [lindex $regionshape_icons $newval]

}


ttk::frame $ds9(main).hack.quick.shapes 
#grid $ds9(main).hack.quick.shapes -row 0 -column $atcol
pack $ds9(main).hack.quick.shapes -side left
incr atcol

ttk::menubutton $ds9(main).hack.quick.shapes.at -menu $ds9(main).hack.quick.shapes.at.m \
  -text "Region Width" \
  -image [lindex $regionshape_icons 0] -takefocus 0

global marker
set marker(shape) "circle"
  
menu $ds9(main).hack.quick.shapes.at.m -tearoff 0

$ds9(main).hack.quick.shapes.at.m add command -label "1" \
    -command "my_change_marker 0 circle" \
    -image [lindex $regionshape_icons 0]

$ds9(main).hack.quick.shapes.at.m add command -label "1" \
    -command "my_change_marker 1 annulus" \
    -image [lindex $regionshape_icons 1]

$ds9(main).hack.quick.shapes.at.m add command -label "1" \
    -command "my_change_marker 2 ellipse" \
    -image [lindex $regionshape_icons 2]

$ds9(main).hack.quick.shapes.at.m add command -label "1" \
    -command "my_change_marker 3 box" \
    -image [lindex $regionshape_icons 3]

$ds9(main).hack.quick.shapes.at.m add command -label "1" \
    -command "my_change_marker 4 polygon" \
    -image [lindex $regionshape_icons 4]

$ds9(main).hack.quick.shapes.at.m add command -label "1" \
    -command "my_change_marker 5 text" \
    -image [lindex $regionshape_icons 5]

grid $ds9(main).hack.quick.shapes.at -row 0 -column 0

# TODO: figure out open region 
# TODO: figure out save region

ttk::button $ds9(main).hack.quick.shapes.info -text {Region Info} \
    -takefocus 0 -command {ds9Cmd "-region getinfo"} \
    -image [image create photo -file "$ds9_hack_root/UI/region_info.png"]

ttk::button $ds9(main).hack.quick.shapes.list -text {Region List} \
    -takefocus 0 -command {ds9Cmd "-region list"} \
    -image [image create photo -file "$ds9_hack_root/UI/region_list.png"]

grid $ds9(main).hack.quick.shapes.info -row 0 -column 1
grid $ds9(main).hack.quick.shapes.list -row 0 -column 2


