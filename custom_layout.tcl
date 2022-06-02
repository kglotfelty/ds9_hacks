
proc LayoutViewVert {} {
    global ds9
    global current
    global view

    # ds9(main) weight
    grid rowconfigure $ds9(main) 4 -weight 0
    grid columnconfigure $ds9(main) 0 -weight 0
    grid rowconfigure $ds9(main) 1 -weight 1
    grid columnconfigure $ds9(main) 2 -weight 1

    grid forget $ds9(panel)
    grid forget $ds9(panel,sep)
    grid forget $ds9(buttons,frame)
    grid forget $ds9(buttons,sep)
    grid forget $ds9(image)
    
    pack forget $ds9(magnifier)
    pack forget $ds9(info)
    pack forget $ds9(panner)

    # info panel
    if {$view(info) || $view(magnifier) || $view(panner)} {
        grid $ds9(panel) -row 1 -column 3 -sticky ns
        $ds9(panel,sep) configure -orient vertical
        grid $ds9(panel,sep) -row 1 -column 4 -sticky ns
    }

    if {$view(panner)} {
        grid $ds9(panner) -row 1 -column 1 -padx 2 -pady 2
        add_panner_controls
        grid $ds9(panner_controls) -row 2 -column 1 -padx 2 -pady 2
    }

    if {$view(magnifier)} {
        grid $ds9(magnifier) -row 3 -column 1 -padx 2 -pady 2
        add_magnifier_controls
        grid $ds9(magnifier_controls) -row 4 -column 1 -padx 2 -pady 2 

    }

    if {$view(info)} {
        grid $ds9(info) -row 5 -column 1 -padx 2 -pady 2
    }

    # buttons
    if {$view(buttons)} {
        grid $ds9(buttons,frame) -row 1 -column 5 -sticky ns
        $ds9(buttons,sep) configure -orient vertical
        grid $ds9(buttons,sep) -row 1 -column 6 -sticky ns
    }

    # image
    grid $ds9(image) -row 1 -column 2 -sticky news

    # -------- GUI frames, top, left, and bottom

    add_bottom_buttons
    grid $ds9(hack_bottom) -row 2 -column 1 -columnspan 3 -sticky we

    if { [winfo exists $ds9(main).hack_top] == 0 } {
        ttk::frame $ds9(main).hack_top
        set ds9(hack_top) $ds9(main).hack_top
    }
    grid $ds9(hack_top) -row -0 -column 0 -columnspan 4 -sticky we

    if { [winfo exists $ds9(main).hack_left] == 0 } {
        ttk::frame $ds9(main).hack_left
        set ds9(hack_left) $ds9(main).hack_left
    }
    grid $ds9(hack_left) -row 1 -column 0 -sticky ns

    
}

proc add_panner_controls {} {
    global ds9
    global ds9_hack_root
    
    if { [winfo exists $ds9(panel).align_center]} {
        return
    }

    ttk::frame $ds9(panel).align_center
    set ds9(panner_controls) $ds9(panel).align_center
    
    ttk::button $ds9(panner_controls).align -text {Align} -takefocus 0 \
        -command {ds9Cmd "-rotate to 0"} \
        -image [image create photo -file "$ds9_hack_root/UI/north_up.png"] 

    ttk::button $ds9(panner_controls).center -text {Center} -takefocus 0 \
        -command {ds9Cmd "-frame center"} \
        -image [image create photo -file "$ds9_hack_root/UI/center.png"] 

    pack $ds9(panner_controls).align -side left -fill x -expand 1
    pack $ds9(panner_controls).center -side left  -fill x -expand 1

    if { ![catch {package require tooltip}] } {
        tooltip::tooltip $ds9(panner_controls).align "Align North Up"
        tooltip::tooltip $ds9(panner_controls).center "Pan to Center"
    }


}

proc add_magnifier_controls {} {
    global ds9
    global ds9_hack_root

    if { [winfo exists $ds9(panel).change_magzoom] } {
        return
    }

    ttk::frame $ds9(panel).change_magzoom
    set ds9(magnifier_controls) $ds9(panel).change_magzoom
    
    ttk::button $ds9(magnifier_controls).minus -text {-} -takefocus 0 \
        -command {change_magzoom_level 0.5} -width 6
    ttk::button $ds9(magnifier_controls).plus -text {+} -takefocus 0 \
        -command {change_magzoom_level 2.0} -width 6
    pack $ds9(magnifier_controls).minus -side left 
    pack $ds9(magnifier_controls).plus -side left 


    if { ![catch {package require tooltip}] } {
        tooltip::tooltip $ds9(magnifier_controls).minus "Decrease Magnification"
        tooltip::tooltip $ds9(magnifier_controls).plus "Increase Magnification"
    }
    
}


proc change_magzoom_level { factor } {
    global pmagnifier

    set newzoom [expr $pmagnifier(zoom) * $factor]

    ds9Cmd "-magnifier zoom $newzoom"

}


proc add_bottom_buttons {} {
    global ds9_hack_root
    
    source $ds9_hack_root/gui_bottom.tcl
    setup_bottom_button_bar
}


proc add_left_buttons {} {
    global ds9_hack_root
    
    source $ds9_hack_root/gui_left.tcl
    setup_left_button_bar
    
}

proc add_top_buttons {} {
    global ds9_hack_root
    
    source $ds9_hack_root/gui_top.tcl
    setup_top_button_bar

}

