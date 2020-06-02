
ttk::frame $ds9(main).hack.quick_two.zoom
grid $ds9(main).hack.quick_two.zoom -row 0 -column $atcol -columnspan 1 -padx 5
incr atcol



ttk::button $ds9(main).hack.quick_two.zoom.in -text {First} -takefocus 0 \
    -command {ds9Cmd "-zoom in"} \
    -image [image create photo -file "$ds9_hack_root/UI/zoom_plus.png"] 

ttk::button $ds9(main).hack.quick_two.zoom.one -text {First} -takefocus 0 \
    -command {ds9Cmd "-zoom to 1"} \
    -image [image create photo -file "$ds9_hack_root/UI/zoom_one.png"] 

ttk::button $ds9(main).hack.quick_two.zoom.out -text {First} -takefocus 0 \
    -command {ds9Cmd "-zoom out"} \
    -image [image create photo -file "$ds9_hack_root/UI/zoom_minus.png"] 


grid $ds9(main).hack.quick_two.zoom.out -row 0 -column 0
grid $ds9(main).hack.quick_two.zoom.one -row 0 -column 1
grid $ds9(main).hack.quick_two.zoom.in -row 0 -column 2
