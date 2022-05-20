
ttk::frame $ds9(main).hack_bottom.block
pack $ds9(main).hack_bottom.block -side left -padx 5


ttk::button $ds9(main).hack_bottom.block.in -text {First} -takefocus 0 \
    -command {ds9Cmd "-block in"} \
    -image [image create photo -file "$ds9_hack_root/UI/block_increase.png"] 

ttk::button $ds9(main).hack_bottom.block.one -text {First} -takefocus 0 \
    -command {ds9Cmd "-block to 1"} \
    -image [image create photo -file "$ds9_hack_root/UI/block_one.png"] 

ttk::button $ds9(main).hack_bottom.block.out -text {First} -takefocus 0 \
    -command {ds9Cmd "-block out"} \
    -image [image create photo -file "$ds9_hack_root/UI/block_decrease.png"] 


pack $ds9(main).hack_bottom.block.out -side left
pack $ds9(main).hack_bottom.block.one -side left
pack $ds9(main).hack_bottom.block.in -side left
