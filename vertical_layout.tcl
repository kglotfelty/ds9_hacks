


proc LayoutViewVert {} {
    global ds9
    global current
    global view

    # canvas
    grid rowconfigure $ds9(main) 1 -weight 1
    grid columnconfigure $ds9(main) 4 -weight 1
    grid $ds9(image) -row 1 -column 4 

    # info panel
    if {$view(info) || $view(magnifier) || $view(panner)} {
	grid $ds9(panel) -row 1 -column 0 -sticky ns
	$ds9(panel,sep) configure -orient vertical
	grid $ds9(panel,sep) -row 1 -column 1 -sticky ns
    } else {
	grid forget $ds9(panel)
	grid forget $ds9(panel,sep)
    }

    if {$view(magnifier)} {
	pack $ds9(magnifier) -side top -padx 2 -pady 2
    } else {
	pack forget $ds9(magnifier)
    }

    if {$view(info)} {
	pack $ds9(info) -side top -padx 2 -pady 2 -fill y -expand true
	if {$view(magnifier)} {
	    pack $ds9(info) -after $ds9(magnifier)
	}
    } else {
	pack forget $ds9(info)
    }

    if {$view(panner)} {
	pack $ds9(panner) -side bottom -padx 2 -pady 2
    } else {
	pack forget $ds9(panner)
    }

    # buttons
    if {$view(buttons)} {
	grid $ds9(buttons) -row 1 -column 2 -sticky ns
	$ds9(buttons,sep) configure -orient vertical
	grid $ds9(buttons,sep) -row 1 -column 3 -sticky ns
    } else {
	grid forget $ds9(buttons)
	grid forget $ds9(buttons,sep)
    }
}
