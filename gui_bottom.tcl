

proc setup_bottom_button_bar {} {
    global ds9
    global ds9_hack_root

    if { [winfo exists $ds9(main).hack_bottom] } {
        return
    }

    ttk::frame $ds9(main).hack_bottom
    set ds9(hack_bottom) $ds9(main).hack_bottom

    add_bin_buttons
    add_block_buttons
    add_zoom_buttons
    add_frame_buttons

}


proc add_bin_buttons {} {
    global ds9
    global ds9_hack_root
    ttk::frame $ds9(hack_bottom).bin
    pack $ds9(hack_bottom).bin -side left

    ttk::button $ds9(hack_bottom).bin.in -text {Bin In} -takefocus 0 \
        -command {ds9Cmd "-bin in"} \
        -image [image create photo -file "$ds9_hack_root/UI/bin_increase.png"] 

    ttk::button $ds9(hack_bottom).bin.one -text {Bin To 1} -takefocus 0 \
        -command {ds9Cmd "-bin to 1"} \
        -image [image create photo -file "$ds9_hack_root/UI/bin_one.png"] 

    ttk::button $ds9(hack_bottom).bin.out -text {Bin Out} -takefocus 0 \
        -command {ds9Cmd "-bin out"} \
        -image [image create photo -file "$ds9_hack_root/UI/bin_decrease.png"] 

    pack $ds9(hack_bottom).bin.out -side left
    pack $ds9(hack_bottom).bin.one -side left
    pack $ds9(hack_bottom).bin.in -side left

    if { ![catch {package require tooltip}] } {
        tooltip::tooltip $ds9(hack_bottom).bin.in "Increase Bin"
        tooltip::tooltip $ds9(hack_bottom).bin.one "Set Bin to 1"
        tooltip::tooltip $ds9(hack_bottom).bin.out "Decrease Bin"
    }
    
}

proc add_block_buttons {} {
    global ds9
    global ds9_hack_root

    ttk::frame $ds9(hack_bottom).block
    pack $ds9(hack_bottom).block -side left -padx 5

    ttk::button $ds9(hack_bottom).block.in -text {Block In} -takefocus 0 \
        -command {ds9Cmd "-block in"} \
        -image [image create photo -file "$ds9_hack_root/UI/block_increase.png"] 

    ttk::button $ds9(hack_bottom).block.one -text {Block to 1} -takefocus 0 \
        -command {ds9Cmd "-block to 1"} \
        -image [image create photo -file "$ds9_hack_root/UI/block_one.png"] 

    ttk::button $ds9(hack_bottom).block.out -text {Block Out} -takefocus 0 \
        -command {ds9Cmd "-block out"} \
        -image [image create photo -file "$ds9_hack_root/UI/block_decrease.png"] 

    pack $ds9(hack_bottom).block.out -side left
    pack $ds9(hack_bottom).block.one -side left
    pack $ds9(hack_bottom).block.in -side left


    if { ![catch {package require tooltip}] } {
        tooltip::tooltip $ds9(hack_bottom).block.in "Increase Block"
        tooltip::tooltip $ds9(hack_bottom).block.one "Set Block to 1"
        tooltip::tooltip $ds9(hack_bottom).block.out "Decrease Block"
    }
    
}

proc add_zoom_buttons {} {
    global ds9
    global ds9_hack_root

    ttk::frame $ds9(hack_bottom).zoom
    pack $ds9(hack_bottom).zoom -side left -padx 5

    ttk::button $ds9(hack_bottom).zoom.in -text {Zoom In} -takefocus 0 \
        -command {ds9Cmd "-zoom in"} \
        -image [image create photo -file "$ds9_hack_root/UI/zoom_plus.png"] 

    ttk::button $ds9(hack_bottom).zoom.one -text {Zoom to 1} -takefocus 0 \
        -command {ds9Cmd "-zoom to 1"} \
        -image [image create photo -file "$ds9_hack_root/UI/zoom_one.png"] 

    ttk::button $ds9(hack_bottom).zoom.out -text {Zoom Out} -takefocus 0 \
        -command {ds9Cmd "-zoom out"} \
        -image [image create photo -file "$ds9_hack_root/UI/zoom_minus.png"] 

    pack $ds9(hack_bottom).zoom.out -side left
    pack $ds9(hack_bottom).zoom.one -side left
    pack $ds9(hack_bottom).zoom.in -side left

    if { ![catch {package require tooltip}]} {
        tooltip::tooltip $ds9(hack_bottom).zoom.out "Zoom Out"
        tooltip::tooltip $ds9(hack_bottom).zoom.one "Set Zoom to 1"
        tooltip::tooltip $ds9(hack_bottom).zoom.in "Zoom In"
    }
    
}

global frame_icons
set frame_icons [ list [image create photo -file "$ds9_hack_root/UI/frame_single.png"] \
                       [image create photo -file "$ds9_hack_root/UI/frame_tile_grid.png"] \
                       [image create photo -file "$ds9_hack_root/UI/frame_tile_col.png"] \
                       [image create photo -file "$ds9_hack_root/UI/frame_tile_row.png"] \
                       [image create photo -file "$ds9_hack_root/UI/frame_blink.png"] \
                ]

proc add_frame_buttons {} {
    global ds9
    global ds9_hack_root
    global frame_icons
    global current

    ttk::button $ds9(hack_bottom).add -text {Add Frame} -takefocus 0 \
        -command {ds9Cmd "-frame new"} \
        -image [image create photo -file "$ds9_hack_root/UI/frame_add.png"] 

    ttk::button $ds9(hack_bottom).del -text {Delete Frame} -takefocus 0 \
        -command {ds9Cmd "-frame delete"} \
        -image [image create photo -file "$ds9_hack_root/UI/frame_del.png"] 


    ttk::button $ds9(hack_bottom).first -text {First Frame} -takefocus 0 \
        -command {ds9Cmd "-frame first"} \
        -image [image create photo -file "$ds9_hack_root/UI/frame_first.png"] 

    ttk::button $ds9(hack_bottom).prev -text {Previous Frame} -takefocus 0 \
        -command {ds9Cmd "-frame prev"} \
        -image [image create photo -file "$ds9_hack_root/UI/frame_prev.png"] 

    ttk::menubutton $ds9(hack_bottom).at -menu $ds9(hack_bottom).at.m \
      -text "Frame State" -direction above\
      -image [lindex $frame_icons 0] -takefocus 0
     
    menu $ds9(hack_bottom).at.m -tearoff 0

    $ds9(hack_bottom).at.m add command -label [msgcat::mc {Single Frame}] \
        -command {my_change_frame 0 "single"} \
        -image [lindex $frame_icons 0] -compound left

    $ds9(hack_bottom).at.m add command -label [msgcat::mc {Tile Frames (grid)}] \
        -command {my_change_frame 1 "tile mode grid"} \
        -image [lindex $frame_icons 1] -compound left 
    $ds9(hack_bottom).at.m add command -label [msgcat::mc {Tile Frames (columns)}] \
        -command {my_change_frame 2 "tile mode column"} \
        -image [lindex $frame_icons 2] -compound left 
    $ds9(hack_bottom).at.m add command -label [msgcat::mc {Tile Frames (rows)}] \
        -command {my_change_frame 3 "tile mode row"} \
        -image [lindex $frame_icons 3] -compound left 


    $ds9(hack_bottom).at.m add command -label [msgcat::mc {Blink Frames}] \
        -command {my_change_frame 4 "blink"} \
        -image [lindex $frame_icons 4]  -compound left


    ttk::button $ds9(hack_bottom).next -text {Next Frame} -takefocus 0 \
        -command {ds9Cmd "-frame next"} \
        -image [image create photo -file "$ds9_hack_root/UI/frame_next.png"] 

    ttk::button $ds9(hack_bottom).last -text {Last Frame} -takefocus 0 \
        -command {ds9Cmd "-frame last"} \
        -image [image create photo -file "$ds9_hack_root/UI/frame_last.png"] 

    ttk::button $ds9(hack_bottom).view_vert -text {Vertical Graph} \
      -takefocus 0 \
      -image [image create photo -file "$ds9_hack_root/UI/view_vertical.png"] \
      -command [list toggle_view_graph vert]

    ttk::button $ds9(hack_bottom).view_horz -text {Horizontal Graph} \
      -takefocus 0 \
      -image [image create photo -file "$ds9_hack_root/UI/view_horizontal.png"] \
      -command [list toggle_view_graph horz]

    ttk::button $ds9(hack_bottom).view_color -text {Colorbar} \
      -takefocus 0 \
      -image [image create photo -file "$ds9_hack_root/UI/view_colorbar.png"] \
      -command toggle_view_colorbar      

    pack $ds9(hack_bottom).add -side left -padx {10 0}
    pack $ds9(hack_bottom).del -side left 
    pack $ds9(hack_bottom).first -side left 
    pack $ds9(hack_bottom).prev -side left 
    pack $ds9(hack_bottom).at -side left 
    pack $ds9(hack_bottom).next -side left 
    pack $ds9(hack_bottom).last -side left 
    pack $ds9(hack_bottom).view_vert -side left -padx {10 0}
    pack $ds9(hack_bottom).view_horz -side left
    pack $ds9(hack_bottom).view_color -side left


    trace add variable current(display) write "sync_frame_display"

    if { ![catch {package require tooltip}] } {
        tooltip::tooltip $ds9(hack_bottom).add "Add New Frame"
        tooltip::tooltip $ds9(hack_bottom).del "Delete Frame"
        tooltip::tooltip $ds9(hack_bottom).first "Goto First Frame"
        tooltip::tooltip $ds9(hack_bottom).prev "Goto Previous Frame"
        tooltip::tooltip $ds9(hack_bottom).at "Frame Layout"
        tooltip::tooltip $ds9(hack_bottom).next "Goto Next Frame"
        tooltip::tooltip $ds9(hack_bottom).last "Goto Last Frame"
            
        tooltip::tooltip $ds9(hack_bottom).view_vert "Toggle Vertical Graph"
        tooltip::tooltip $ds9(hack_bottom).view_horz "Toggle Horizontal Graph"
        tooltip::tooltip $ds9(hack_bottom).view_color "Toggle Colorbar"
    }



}



proc my_change_frame { newval iswhat } {
  global ds9
  global frame_icons

  if {[string match "tile*" $iswhat]} {
      ds9Cmd "-tile on"
  } else {
      ds9Cmd "-tile off"
  }
  ds9Cmd "-$iswhat"

  $ds9(hack_bottom).at configure -text $newval \
    -image [lindex $frame_icons $newval]

}


proc sync_frame_display {name1 name2 op} {
    global current
    global tile
    switch $current(display) {
        single      {my_change_frame 0 $current(display)}


        tile        {
            switch $tile(mode) {
              grid   {my_change_frame 1 "tile mode grid"}
              column {my_change_frame 2 "tile mode column"}
              row    {my_change_frame 3 "tile mode row"}
        } }
        blink       {my_change_frame 4 $current(display)}
    }


}



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
