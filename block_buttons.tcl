
ttk::frame $ds9(main).hack.quick_two.block
grid $ds9(main).hack.quick_two.block -row 0 -column $atcol -columnspan 1 -padx 5
incr atcol



ttk::button $ds9(main).hack.quick_two.block.in -text {First} -takefocus 0 \
    -command {ds9Cmd "-block in"} \
    -image [image create photo -file "$ds9_hack_root/UI/block_increase.png"] 

ttk::button $ds9(main).hack.quick_two.block.one -text {First} -takefocus 0 \
    -command {ds9Cmd "-block to 1"} \
    -image [image create photo -file "$ds9_hack_root/UI/block_one.png"] 

ttk::button $ds9(main).hack.quick_two.block.out -text {First} -takefocus 0 \
    -command {ds9Cmd "-block out"} \
    -image [image create photo -file "$ds9_hack_root/UI/block_decrease.png"] 


grid $ds9(main).hack.quick_two.block.out -row 0 -column 0
grid $ds9(main).hack.quick_two.block.one -row 0 -column 1
grid $ds9(main).hack.quick_two.block.in -row 0 -column 2
