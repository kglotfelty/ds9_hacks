

ttk::frame $ds9(main).hack_left.layer
pack $ds9(main).hack_left.layer -side top -fill x -padx 5

ttk::button $ds9(main).hack_left.layer.back -text {Back} -takefocus 0 -command {MarkerBack } \
    -image [image create photo -file "$ds9_hack_root/UI/back.png"]
ttk::button $ds9(main).hack_left.layer.front -text {Front} -takefocus 0 -command {MarkerFront} \
    -image [image create photo -file "$ds9_hack_root/UI/front.png"]

pack $ds9(main).hack_left.layer.back -side top -fill x
pack $ds9(main).hack_left.layer.front -side top -fill x
