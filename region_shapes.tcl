proc my_change_marker { iswhat } {
  global ds9
  global marker

  set marker(shape) $iswhat

}


frame $ds9(main).quick.shapes
grid $ds9(main).quick.shapes -row 0 -column $atcol -columnspan 1 -padx 5
incr atcol

button $ds9(main).quick.shapes.circle -text {C} -takefocus 0 -command {my_change_marker circle} \
    -image [image create photo -file "$ds9_hack_root/UI/circle.png"] 
button $ds9(main).quick.shapes.annulus -text {A} -takefocus 0 -command {my_change_marker annulus} \
    -image [image create photo -file "$ds9_hack_root/UI/annulus.png"]
button $ds9(main).quick.shapes.ellipse -text {E} -takefocus 0 -command {my_change_marker ellipse} \
    -image [image create photo -file "$ds9_hack_root/UI/ellipse.png"]
button $ds9(main).quick.shapes.box -text {B} -takefocus 0 -command {my_change_marker box} \
    -image [image create photo -file "$ds9_hack_root/UI/box.png"]
button $ds9(main).quick.shapes.poly -text {P} -takefocus 0 -command {my_change_marker polygon} \
    -image [image create photo -file "$ds9_hack_root/UI/poly.png"]
button $ds9(main).quick.shapes.text -text {T} -takefocus 0 -command {my_change_marker text} \
    -image [image create photo -file "$ds9_hack_root/UI/text.png"]


grid $ds9(main).quick.shapes.circle -row 0 -column 0
grid $ds9(main).quick.shapes.annulus -row 0 -column 1
grid $ds9(main).quick.shapes.ellipse -row 0 -column 2
grid $ds9(main).quick.shapes.box -row 0 -column 3
grid $ds9(main).quick.shapes.poly -row 0 -column 4
grid $ds9(main).quick.shapes.text -row 0 -column 5

