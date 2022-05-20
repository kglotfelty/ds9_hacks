
ttk::frame $ds9(main).hack_bottom.bin
pack $ds9(main).hack_bottom.bin -side left

ttk::button $ds9(main).hack_bottom.bin.in -text {First} -takefocus 0 \
    -command {ds9Cmd "-bin in"} \
    -image [image create photo -file "$ds9_hack_root/UI/bin_increase.png"] 

ttk::button $ds9(main).hack_bottom.bin.one -text {First} -takefocus 0 \
    -command {ds9Cmd "-bin to 1"} \
    -image [image create photo -file "$ds9_hack_root/UI/bin_one.png"] 

ttk::button $ds9(main).hack_bottom.bin.out -text {First} -takefocus 0 \
    -command {ds9Cmd "-bin out"} \
    -image [image create photo -file "$ds9_hack_root/UI/bin_decrease.png"] 


pack $ds9(main).hack_bottom.bin.out -side left
pack $ds9(main).hack_bottom.bin.one -side left
pack $ds9(main).hack_bottom.bin.in -side left
