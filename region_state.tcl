

proc my_change_srcbkg {} {
    global marker

    if { $marker(source) == 0 } {
        set marker(source) 1
    } else {
        set marker(source) 0
    }

    MarkerProp source

}


proc my_change_incexl {} {
    global marker

    if { $marker(include) == 0 } {
        set marker(include) 1
    } else {
        set marker(include) 0
    }

    MarkerProp include
    
}


ttk::frame $ds9(main).hack_left.state
pack $ds9(main).hack_left.state -side top -fill x -padx 5

ttk::button $ds9(main).hack_left.state.src -text {S/B} -takefocus 0 -command {my_change_srcbkg} \
    -image [image create photo -file "$ds9_hack_root/UI/srcbkg.png"]
ttk::button $ds9(main).hack_left.state.inc -text {I/E} -takefocus 0 -command {my_change_incexl} \
    -image [image create photo -file "$ds9_hack_root/UI/incexl.png"]
pack $ds9(main).hack_left.state.src -side top -fill x
pack $ds9(main).hack_left.state.inc -side top -fill x

