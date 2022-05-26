

ttk::frame $ds9(main).hack_left.layer
pack $ds9(main).hack_left.layer -side top -fill x -padx 5

ttk::button $ds9(main).hack_left.layer.back -text {Back} -takefocus 0 -command {MarkerBack } \
    -image [image create photo -file "$ds9_hack_root/UI/back.png"]
ttk::button $ds9(main).hack_left.layer.front -text {Front} -takefocus 0 -command {MarkerFront} \
    -image [image create photo -file "$ds9_hack_root/UI/front.png"]



ttk::button $ds9(main).hack_left.layer.compose -text {Composite} -takefocus 0 -command {CompositeCreate } \
    -image [image create photo -file "$ds9_hack_root/UI/region_compose.png"]
ttk::button $ds9(main).hack_left.layer.dissolve -text {Dissolve} -takefocus 0 -command {CompositeDelete} \
    -image [image create photo -file "$ds9_hack_root/UI/region_dissolve.png"]

ttk::button $ds9(main).hack_left.layer.group -text {Group} -takefocus 0 -command {GroupCreate} \
    -image [image create photo -file "$ds9_hack_root/UI/region_group.png"]


pack $ds9(main).hack_left.layer.back -side top -fill x
pack $ds9(main).hack_left.layer.front -side top -fill x
pack $ds9(main).hack_left.layer.compose -side top -fill x
pack $ds9(main).hack_left.layer.dissolve -side top -fill x
pack $ds9(main).hack_left.layer.group -side top -fill x
