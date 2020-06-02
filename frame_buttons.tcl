
ttk::frame $ds9(main).hack.quick_two.frames
grid $ds9(main).hack.quick_two.frames -row 0 -column $atcol -columnspan 1 -padx 5
incr atcol



ttk::button $ds9(main).hack.quick_two.frames.first -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame first"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_first.png"] 

ttk::button $ds9(main).hack.quick_two.frames.prev -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame prev"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_prev.png"] 

ttk::button $ds9(main).hack.quick_two.frames.stop -text {First} -takefocus 0 \
    -command {ds9Cmd "-blink no"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_stop.png"] 

ttk::button $ds9(main).hack.quick_two.frames.blink -text {First} -takefocus 0 \
    -command {ds9Cmd "-blink yes"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_blink.png"] 

ttk::button $ds9(main).hack.quick_two.frames.next -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame next"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_next.png"] 

ttk::button $ds9(main).hack.quick_two.frames.last -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame last"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_last.png"] 

grid $ds9(main).hack.quick_two.frames.first -row 0 -column 0
grid $ds9(main).hack.quick_two.frames.prev -row 0 -column 1
grid $ds9(main).hack.quick_two.frames.stop -row 0 -column 2
grid $ds9(main).hack.quick_two.frames.blink -row 0 -column 3
grid $ds9(main).hack.quick_two.frames.next -row 0 -column 4
grid $ds9(main).hack.quick_two.frames.last -row 0 -column 5
