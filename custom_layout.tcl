
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
    }

    if {$view(magnifier)} {
        grid $ds9(magnifier) -row 2 -column 1 -padx 2 -pady 2

        if { [winfo exists $ds9(panel).change_magzoom] == 0 } {

            ttk::frame $ds9(panel).change_magzoom
            grid $ds9(panel).change_magzoom -row 3 -column 1 -padx 2 -pady 2 
            
            ttk::button $ds9(panel).change_magzoom.minus -text {-} -takefocus 0 \
                -command {change_magzoom_level 0.5} -width 6
            ttk::button $ds9(panel).change_magzoom.plus -text {+} -takefocus 0 \
                -command {change_magzoom_level 2.0} -width 6
            pack $ds9(panel).change_magzoom.minus -side left 
            pack $ds9(panel).change_magzoom.plus -side left 

        }   

    }

    if {$view(info)} {
        grid $ds9(info) -row 4 -column 1 -padx 2 -pady 2
    }


    # buttons
    if {$view(buttons)} {
        grid $ds9(buttons,frame) -row 1 -column 5 -sticky ns
        $ds9(buttons,sep) configure -orient vertical
        grid $ds9(buttons,sep) -row 1 -column 6 -sticky ns
    }

    # image
    grid $ds9(image) -row 1 -column 2 -sticky news
}

proc change_magzoom_level { factor } {
    global pmagnifier

    set newzoom [expr $pmagnifier(zoom) * $factor]


    ds9Cmd "-magnifier zoom $newzoom"
    

}
