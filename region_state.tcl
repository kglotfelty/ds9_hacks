


proc my_change_srcbkg {} {
  global ds9
  global marker

    if { $marker(source) == 0 } {
	set marker(source) 1
    } else {
	set marker(source) 0
    }

    MarkerProp source

}


proc my_change_incexl {} {
  global ds9
  global marker

    if { $marker(include) == 0 } {
	set marker(include) 1
    } else {
	set marker(include) 0
    }

    MarkerProp include

}


frame $ds9(main).quick.state
grid $ds9(main).quick.state -row 0 -column $atcol -padx 5
incr atcol

button $ds9(main).quick.state.src -text {S/B} -takefocus 0 -command {my_change_srcbkg} \
    -image [image create photo -file "$ds9_hack_root/UI/srcbkg.png"]
button $ds9(main).quick.state.inc -text {I/E} -takefocus 0 -command {my_change_incexl} \
    -image [image create photo -file "$ds9_hack_root/UI/incexl.png"]
grid $ds9(main).quick.state.src -row 0 -column 0
grid $ds9(main).quick.state.inc -row 0 -column 1

