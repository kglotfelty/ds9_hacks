
ttk::frame $ds9(main).hack.quick_two.bin
grid $ds9(main).hack.quick_two.bin -row 0 -column $atcol -columnspan 1 -padx 5
incr atcol



ttk::button $ds9(main).hack.quick_two.bin.in -text {First} -takefocus 0 \
    -command {ds9Cmd "-bin in"} \
    -image [image create photo -file "$ds9_hack_root/UI/bin_increase.png"] 

ttk::button $ds9(main).hack.quick_two.bin.one -text {First} -takefocus 0 \
    -command {ds9Cmd "-bin to 1"} \
    -image [image create photo -file "$ds9_hack_root/UI/bin_one.png"] 

ttk::button $ds9(main).hack.quick_two.bin.out -text {First} -takefocus 0 \
    -command {ds9Cmd "-bin out"} \
    -image [image create photo -file "$ds9_hack_root/UI/bin_decrease.png"] 


grid $ds9(main).hack.quick_two.bin.out -row 0 -column 0
grid $ds9(main).hack.quick_two.bin.one -row 0 -column 1
grid $ds9(main).hack.quick_two.bin.in -row 0 -column 2
