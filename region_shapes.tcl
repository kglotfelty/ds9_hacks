
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
grid $ds9(main).hack.quick.shapes -row 0 -column $atcol
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



#~ ttk::frame $ds9(main).hack.quick.shapes
#~ grid $ds9(main).hack.quick.shapes -row 0 -column $atcol -columnspan 1 -padx 5
#~ incr atcol

#~ ttk::button $ds9(main).hack.quick.shapes.circle -text {C} -takefocus 0 -command {my_change_marker circle} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/circle.png"] 
#~ ttk::button $ds9(main).hack.quick.shapes.annulus -text {A} -takefocus 0 -command {my_change_marker annulus} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/annulus.png"]
#~ ttk::button $ds9(main).hack.quick.shapes.ellipse -text {E} -takefocus 0 -command {my_change_marker ellipse} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/ellipse.png"]
#~ ttk::button $ds9(main).hack.quick.shapes.box -text {B} -takefocus 0 -command {my_change_marker box} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/box.png"]
#~ ttk::button $ds9(main).hack.quick.shapes.poly -text {P} -takefocus 0 -command {my_change_marker polygon} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/poly.png"]
#~ ttk::button $ds9(main).hack.quick.shapes.text -text {T} -takefocus 0 -command {my_change_marker text} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/text.png"]


#~ grid $ds9(main).hack.quick.shapes.circle -row 0 -column 0
#~ grid $ds9(main).hack.quick.shapes.annulus -row 0 -column 1
#~ grid $ds9(main).hack.quick.shapes.ellipse -row 0 -column 2
#~ grid $ds9(main).hack.quick.shapes.box -row 0 -column 3
#~ grid $ds9(main).hack.quick.shapes.poly -row 0 -column 4
#~ grid $ds9(main).hack.quick.shapes.text -row 0 -column 5

