
global scale_icons
global lutbar_icons
global lutbar_names
global unknown_icon
global lutbar



set scale_icons [ list [image create photo -file "$ds9_hack_root/UI/log.png"] \
                       [image create photo -file "$ds9_hack_root/UI/lin.png"] \
                       [image create photo -file "$ds9_hack_root/UI/pow.png"] \
                       [image create photo -file "$ds9_hack_root/UI/scale_other.png"] \
                        ]


proc setup_top_button_bar {} {
    global ds9
    global ds9_hack_root
    global scale
    global scale_icons
    global colorbar

    if { [winfo exists $ds9(main).hack_top] } {
        return
    }

    ttk::frame $ds9(main).hack_top
    set ds9(hack_top) $ds9(main).hack_top

    ttk::button $ds9(hack_top).file_open -text "File Open" \
      -takefocus 0 -command [list OpenDialog fits] \
      -image [image create photo -file "$ds9_hack_root/UI/file_open.png"]

    ttk::button $ds9(hack_top).save_eps -text "Save As EPS" \
      -takefocus 0 -command [list SaveImageDialog eps] \
      -image [image create photo -file "$ds9_hack_root/UI/save_as_eps.png"]

    ttk::button $ds9(hack_top).save_png -text "Save As PNG" \
      -takefocus 0 -command [list SaveImageDialog png] \
      -image [image create photo -file "$ds9_hack_root/UI/save_as_png.png"]

    ttk::button $ds9(hack_top).print -text "Print" \
      -takefocus 0 -command PSPrint \
      -image [image create photo -file "$ds9_hack_root/UI/print.png"]

    ttk::button $ds9(hack_top).backup -text "Backup" \
      -takefocus 0 -command BackupDialog \
      -image [image create photo -file "$ds9_hack_root/UI/backup.png"]

    ttk::button $ds9(hack_top).prism -text "Prism" \
      -takefocus 0 -command [list PrismDialogLoad prism] \
      -image [image create photo -file "$ds9_hack_root/UI/prism.png"]

    ttk::button $ds9(hack_top).notes -text "Notes" \
      -takefocus 0 -command DisplayNotes \
      -image [image create photo -file "$ds9_hack_root/UI/notes.png"]

    # lut

    add_lut_colorbar_menu

    ttk::button $ds9(hack_top).invert -text {Invert} -takefocus 0\
      -command toggle_colorbar_invert \
      -image [image create photo -file "$ds9_hack_root/UI/colorbar_reverse.png"] 
    

    # image_scale

    ttk::menubutton $ds9(hack_top).scale -menu $ds9(hack_top).scale.m \
      -text "Region Width" \
      -image [lindex $scale_icons 0] -takefocus 0

    menu $ds9(hack_top).scale.m -tearoff 0

    $ds9(hack_top).scale.m add command -label [msgcat::mc {Log}] \
        -command {button_change_scale 0 log} \
        -image [lindex $scale_icons 0] -compound left

    $ds9(hack_top).scale.m add command -label [msgcat::mc {Linear}] \
        -command {button_change_scale 1 linear} \
        -image [lindex $scale_icons 1] -compound left

    $ds9(hack_top).scale.m add command -label [msgcat::mc {Power}] \
        -command {button_change_scale 2 pow} \
        -image [lindex $scale_icons 2] -compound left

    ttk::button $ds9(hack_top).limits -text {Scale Parameters} -takefocus 0\
      -command ScaleDialog \
      -image [image create photo -file "$ds9_hack_root/UI/scale_limits.png"] 

    # image_proc
    ttk::button $ds9(hack_top).smth -text {Smooth} -takefocus 0 -command {toggle_smooth} \
       -image [image create photo -file "$ds9_hack_root/UI/smooth.png"]
    ttk::button $ds9(hack_top).cntr -text {Contour} -takefocus 0 -command {toggle_contour} \
       -image [image create photo -file "$ds9_hack_root/UI/contour.png"]
    ttk::button  $ds9(hack_top).wcs -text {Match Frame on WCS} -takefocus 0 -command {ds9Cmd "-match frame wcs" } \
       -image [image create photo -file "$ds9_hack_root/UI/match.png"]
    ttk::button  $ds9(hack_top).cgrid -text {Coordinate Grid} -takefocus 0 -command {toggle_grid} \
       -image [image create photo -file "$ds9_hack_root/UI/coord_grid.png"]



    ttk::button $ds9(hack_top).quit -text {Quit} -takefocus 0 -command {ds9Cmd "-exit"} \
       -image [image create photo -file "$ds9_hack_root/UI/quit.png"]


    pack $ds9(hack_top).file_open -side left -padx {5 0}
    pack $ds9(hack_top).save_eps -side left 
    pack $ds9(hack_top).save_png -side left 
    pack $ds9(hack_top).print -side left 
    pack $ds9(hack_top).backup -side left 
    pack $ds9(hack_top).prism -side left -padx {5 0}
    pack $ds9(hack_top).notes -side left -padx {0 5}

    pack $ds9(hack_top).lut -side left
    pack $ds9(hack_top).invert -side left

    pack $ds9(hack_top).scale -side left
    pack $ds9(hack_top).limits -side left

    pack $ds9(hack_top).smth -side left
    pack $ds9(hack_top).cntr -side left
    pack $ds9(hack_top).cgrid -side left
    pack $ds9(hack_top).wcs -side left


    pack $ds9(hack_top).quit -side right -padx 5


    if { ![catch {package require tooltip}] } {
        tooltip::tooltip $ds9(hack_top).file_open "File Open"
        tooltip::tooltip $ds9(hack_top).save_eps "Save as EPS"
        tooltip::tooltip $ds9(hack_top).save_png "Save as PNG"
        tooltip::tooltip $ds9(hack_top).print "Print"
        tooltip::tooltip $ds9(hack_top).backup "Backup"
        tooltip::tooltip $ds9(hack_top).prism "Open Prism"
        tooltip::tooltip $ds9(hack_top).notes "Open Notepad"
        tooltip::tooltip $ds9(hack_top).lut "Colormaps"
        tooltip::tooltip $ds9(hack_top).invert "Reverse Colormap"    

        tooltip::tooltip $ds9(hack_top).scale "Scaling Option"
        tooltip::tooltip $ds9(hack_top).limits "Scaling Parameters"
        tooltip::tooltip $ds9(hack_top).smth "Toggle Smooth"
        tooltip::tooltip $ds9(hack_top).cntr "Toggle Contour"
        tooltip::tooltip $ds9(hack_top).cgrid "Toggle Coordinate Grid"
        tooltip::tooltip $ds9(hack_top).wcs "Match Frames on WCS"
        tooltip::tooltip $ds9(hack_top).quit "Exit"
    }


    trace add variable scale(type) write "sync_scale_type"
    trace add variable colorbar(map) write "sync_colormap"

    
}


proc add_lut_colorbar_menu {} {
    global lutbar_icons
    global lutbar_names
    global unknown_icon
    global ds9
    global ds9_hack_root
    global lutbar

    set unknown_lut "$ds9_hack_root/LUT/unknown.png"

    set_default_cmap

    foreach {i} $lutbar {

        if { [file exists $i] == 1 } {

            set oi [image create photo boo -file $i]

            image create photo moo$i -width 200 -height 16
            set goo [moo$i copy boo -zoom 2]
            lappend lutbar_icons moo$i

            set f [split $i "/"]
            set g [lindex $f end]
            set gg [split $g .]
            lappend lutbar_names [lindex $gg 0]
        }
    }

    # Keep unknown colormap separate
    set oi [image create photo boo -file $unknown_lut]
    image create photo moo999 -width 200 -height 16
    set boo99 [moo999 copy boo -zoom 2]
    lappend unknown_icon moo999


    ttk::menubutton $ds9(hack_top).lut -menu $ds9(hack_top).lut.m \
      -text "Lookup Tables" \
      -image [lindex $lutbar_icons 0] -takefocus 0
      
    menu $ds9(hack_top).lut.m -tearoff 0


    for {set i 0} {$i < [llength $lutbar_icons]} {incr i} {
        $ds9(hack_top).lut.m add command -label $i \
            -command "button_change_lut $i 1" \
            -image [lindex $lutbar_icons $i]
    }
    
    
}

proc set_default_cmap {} {
    # This let's me override the list of just the ds9 cmaps

    global lutbar

    if { [info exists lutbar] } {
        return
    }

    set lutbar [list \
        "$ds9_hack_root/LUT/DS9/a.png" \
        "$ds9_hack_root/LUT/DS9/aips0.png" \
        "$ds9_hack_root/LUT/DS9/b.png" \
        "$ds9_hack_root/LUT/DS9/bb.png" \
        "$ds9_hack_root/LUT/DS9/blue.png" \
        "$ds9_hack_root/LUT/DS9/color.png" \
        "$ds9_hack_root/LUT/DS9/cool.png" \
        "$ds9_hack_root/LUT/DS9/green.png" \
        "$ds9_hack_root/LUT/DS9/grey.png" \
        "$ds9_hack_root/LUT/DS9/he.png" \
        "$ds9_hack_root/LUT/DS9/heat.png" \
        "$ds9_hack_root/LUT/DS9/hsv.png" \
        "$ds9_hack_root/LUT/DS9/i8.png" \
        "$ds9_hack_root/LUT/DS9/rainbow.png" \
        "$ds9_hack_root/LUT/DS9/red.png" \
        "$ds9_hack_root/LUT/DS9/sls.png" \
        "$ds9_hack_root/LUT/DS9/staircase.png" \
        "$ds9_hack_root/LUT/DS9/standard.png" \
        ]
}


proc button_change_scale { newval iswhat } {
  global ds9
  global scale_icons

  if { $iswhat != "other" } {
    ds9Cmd "-scale $iswhat"
  }

  $ds9(hack_top).scale configure -text $newval \
    -image [lindex $scale_icons $newval]

}

proc button_change_lut {newval change} {
  global lutbar_icons
  global lutbar_names
  global ds9
  global colorbar
  global unknown_icon

  if { $newval >= 0 } {

      if {$change} {
        ds9Cmd "-cmap [lindex $lutbar_names $newval]"
      }
      $ds9(hack_top).lut configure \
      -text $newval \
      -image [lindex $lutbar_icons $newval]
  } else {
      $ds9(hack_top).lut configure \
      -text $newval \
      -image [lindex $unknown_icon 0]
      
      
  }
}

proc sync_scale_type {name1 name2 op} {
    global scale

    switch $scale(type) {
        log      {button_change_scale 0 $scale(type)}
        linear   {button_change_scale 1 $scale(type)}
        pow      {button_change_scale 2 $scale(type)}
        default  {button_change_scale 3 other}
    }
}

proc sync_colormap {name1 name2 op} {
  global colorbar
  global lutbar_names

  set idx [lsearch $lutbar_names $colorbar(map)]
  button_change_lut $idx 0

}

proc toggle_smooth { } {
  global current
  global smooth
  
  if { [$current(frame) has smooth ] } {
      set smooth(view) 0
  } else {
      set smooth(view) 1      
  }

  SmoothUpdate
}

proc toggle_contour { } {
  global contour
  global current
  
  if { [$current(frame) has contour] } {
    set contour(view) 0
  } else {
    set contour(view) 1      
  }
    
  UpdateContour    
    
}

proc toggle_grid { } {
    global current
    global grid
    
    if { [$current(frame) has grid] } {
        set grid(view) 0
    } else {
        set grid(view) 1        
    }
    
    GridUpdateCurrent
    
}

proc toggle_colorbar_invert {} {
  global colorbar
  
  if { $colorbar(invert) } {
      set colorbar(invert) 0
  } else {
      set colorbar(invert) 1
  }
  
  InvertColorbar
    
    
}

