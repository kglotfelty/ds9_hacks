
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
        pack $ds9(panner) -side top -padx 2 -pady 2
    }

    if {$view(magnifier)} {
        pack $ds9(magnifier) -side top -padx 2 -pady 2
    }

    if {$view(info)} {
        pack $ds9(info) -side top -padx 2 -pady 2 -fill x
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

