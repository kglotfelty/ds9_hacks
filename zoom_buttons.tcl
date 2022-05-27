
ttk::frame $ds9(main).hack_bottom.zoom
pack $ds9(main).hack_bottom.zoom -side left -padx 5

ttk::button $ds9(main).hack_bottom.zoom.in -text {First} -takefocus 0 \
    -command {ds9Cmd "-zoom in"} \
    -image [image create photo -file "$ds9_hack_root/UI/zoom_plus.png"] 

ttk::button $ds9(main).hack_bottom.zoom.one -text {First} -takefocus 0 \
    -command {ds9Cmd "-zoom to 1"} \
    -image [image create photo -file "$ds9_hack_root/UI/zoom_one.png"] 

ttk::button $ds9(main).hack_bottom.zoom.out -text {First} -takefocus 0 \
    -command {ds9Cmd "-zoom out"} \
    -image [image create photo -file "$ds9_hack_root/UI/zoom_minus.png"] 


pack $ds9(main).hack_bottom.zoom.out -side left
pack $ds9(main).hack_bottom.zoom.one -side left
pack $ds9(main).hack_bottom.zoom.in -side left

if { ![catch {package require tooltip}]} {
    tooltip::tooltip $ds9(main).hack_bottom.zoom.out "Zoom Out"
    tooltip::tooltip $ds9(main).hack_bottom.zoom.one "Set Zoom to 1"
    tooltip::tooltip $ds9(main).hack_bottom.zoom.in "Zoom In"
}
