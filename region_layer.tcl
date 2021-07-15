ttk::frame $ds9(main).hack.quick.layer
#~ grid $ds9(main).hack.quick.layer -row 0 -column $atcol -columnspan 1 -padx 5
pack $ds9(main).hack.quick.layer -side left -padx 5

incr atcol
ttk::button $ds9(main).hack.quick.layer.back -text {Back} -takefocus 0 -command {MarkerBack } \
    -image [image create photo -file "$ds9_hack_root/UI/back.png"]
ttk::button $ds9(main).hack.quick.layer.front -text {Front} -takefocus 0 -command {MarkerFront} \
    -image [image create photo -file "$ds9_hack_root/UI/front.png"]

grid $ds9(main).hack.quick.layer.back -row 0 -column 0
grid $ds9(main).hack.quick.layer.front -row 0 -column 1
