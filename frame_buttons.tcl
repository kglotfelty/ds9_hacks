

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

$ds9(main).hack_bottom.frames.at.m add command -label [msgcat::mc {Single Frame}] \
    -command {my_change_frame 0 "single"} \
    -image [lindex $frame_icons 0] -compound left

$ds9(main).hack_bottom.frames.at.m add command -label [msgcat::mc {Tile Frames}] \
    -command {my_change_frame 1 "tile"} \
    -image [lindex $frame_icons 1] -compound left 

$ds9(main).hack_bottom.frames.at.m add command -label [msgcat::mc {Blink Frames}] \
    -command {my_change_frame 2 "blink"} \
    -image [lindex $frame_icons 2]  -compound left


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




global current

trace add variable current(display) write "sync_frame_display"

proc sync_frame_display {name1 name2 op} {
    global current

    switch $current(display) {
        single      {my_change_frame 0 $current(display)}
        tile        {my_change_frame 1 $current(display)}
        blink       {my_change_frame 2 $current(display)}
    }


}








ttk::button $ds9(main).hack_bottom.frames.view_vert -text {Vertical Graph} \
  -takefocus 0 \
  -image [image create photo -file "$ds9_hack_root/UI/view_vertical.png"] \
  -command [list toggle_view_graph vert]

ttk::button $ds9(main).hack_bottom.frames.view_horz -text {Horizontal Graph} \
  -takefocus 0 \
  -image [image create photo -file "$ds9_hack_root/UI/view_horizontal.png"] \
  -command [list toggle_view_graph horz]

ttk::button $ds9(main).hack_bottom.frames.view_color -text {Colorbar} \
  -takefocus 0 \
  -image [image create photo -file "$ds9_hack_root/UI/view_colorbar.png"] \
  -command toggle_view_colorbar
  
pack $ds9(main).hack_bottom.frames.view_vert -side left -padx {10 0}
pack $ds9(main).hack_bottom.frames.view_horz -side left
pack $ds9(main).hack_bottom.frames.view_color -side left
  

proc toggle_view_graph {dir} {
    global view

    if { $view(graph,$dir) } {
        set view(graph,$dir) 0
    } else {
        set view(graph,$dir) 1
    }

    LayoutFrames    
}


proc toggle_view_colorbar {} {
    global view
    global colorbar
    if { $view(colorbar) == 0 } {
        set view(colorbar) 1
        set colorbar(orientation) 0
    } else {
        
        if { $colorbar(orientation) == 0 } { 
            set colorbar(orientation) 1                
        } else {
        set view(colorbar) 0
        }
    }
    
    ColorbarUpdateView
}


