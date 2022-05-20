

global frame_icons
set frame_icons [ list [image create photo -file "$ds9_hack_root/UI/frame_single.png"] \
                       [image create photo -file "$ds9_hack_root/UI/frame_tile.png"] \
                       [image create photo -file "$ds9_hack_root/UI/frame_blink.png"] \
                        ]


proc my_change_frame { newval iswhat } {
  global ds9
  global frame_icons

  ds9Cmd "-$iswhat"

  $ds9(main).hack_bottom.frames.at configure -text $newval \
    -image [lindex $frame_icons $newval]

}


ttk::frame $ds9(main).hack_bottom.frames
pack $ds9(main).hack_bottom.frames -side left -padx 5


ttk::button $ds9(main).hack_bottom.frames.add -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame new"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_add.png"] 

ttk::button $ds9(main).hack_bottom.frames.del -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame delete"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_del.png"] 


ttk::button $ds9(main).hack_bottom.frames.first -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame first"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_first.png"] 

ttk::button $ds9(main).hack_bottom.frames.prev -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame prev"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_prev.png"] 



ttk::menubutton $ds9(main).hack_bottom.frames.at -menu $ds9(main).hack_bottom.frames.at.m \
  -text "Frame State" -direction above\
  -image [lindex $frame_icons 0] -takefocus 0
 
menu $ds9(main).hack_bottom.frames.at.m -tearoff 0

$ds9(main).hack_bottom.frames.at.m add command -label "Single" \
    -command {my_change_frame 0 "single"} \
    -image [lindex $frame_icons 0] 

$ds9(main).hack_bottom.frames.at.m add command -label "Tile" \
    -command {my_change_frame 1 "tile"} \
    -image [lindex $frame_icons 1] 

$ds9(main).hack_bottom.frames.at.m add command -label "Blink" \
    -command {my_change_frame 2 "blink"} \
    -image [lindex $frame_icons 2] 


ttk::button $ds9(main).hack_bottom.frames.next -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame next"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_next.png"] 

ttk::button $ds9(main).hack_bottom.frames.last -text {First} -takefocus 0 \
    -command {ds9Cmd "-frame last"} \
    -image [image create photo -file "$ds9_hack_root/UI/frame_last.png"] 


pack $ds9(main).hack_bottom.frames.add -side left 
pack $ds9(main).hack_bottom.frames.del -side left 
pack $ds9(main).hack_bottom.frames.first -side left 
pack $ds9(main).hack_bottom.frames.prev -side left 
pack $ds9(main).hack_bottom.frames.at -side left 
pack $ds9(main).hack_bottom.frames.next -side left 
pack $ds9(main).hack_bottom.frames.last -side left 
