




global edit_icons
global regionshape_icons
global x11_colors
global color_icons
global regwidth_icons


set edit_icons [list [image create photo -file "$ds9_hack_root/UI/edit_none.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_region.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_crosshair.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_colorbar.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_pan.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_zoom.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_rotate.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_crop.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_catalog.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_footprint.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_3d.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_examine.png" ] \
                   ]

set regionshape_icons [ list [image create photo -file "$ds9_hack_root/UI/circle.png"] \
                             [image create photo -file "$ds9_hack_root/UI/annulus.png"] \
                             [image create photo -file "$ds9_hack_root/UI/ellipse.png"] \
                             [image create photo -file "$ds9_hack_root/UI/box.png"] \
                             [image create photo -file "$ds9_hack_root/UI/poly.png"] \
                             [image create photo -file "$ds9_hack_root/UI/text.png"] \
                             [image create photo -file "$ds9_hack_root/UI/region_other.png"] \
                            ]


set x11_colors [list \
    "red" "floralwhite" "mistyrose" "seashell" "snow" "linen" "oldlace" \
    "whitesmoke" "gainsboro" "lightgray" "dimgray" "green" "bisque" \
    "blanchedalmond" "papayawhip" "antiquewhite" "rosybrown" "moccasin" \
    "navajowhite" "peachpuff" "wheat" "tan" "blue" "darksalmon" "lightcoral" \
    "burlywood" "lightsalmon" "indianred2" "salmon" "sandybrown" "indianred" \
    "coral" "tomato" "cyan" "peru" "brown" "sienna" "chocolate" "goldenrod" \
    "saddlebrown" "darkgoldenrod" "darkorange" "orangered" "ivory" "magenta" \
    "lightyellow" "beige" "cornsilk" "lemonchiffon" "lightgoldenrodyellow" \
    "palegoldenrod" "khaki" "lightgoldenrod" "darkkhaki" "darkolivegreen" \
    "yellow" "greenyellow" "yellowgreen" "olivedrab" "gold" "honeydew" \
    "darkseagreen" "palegreen" "limegreen" "forestgreen" "chartreuse" \
    "black" "lawngreen" "darkgreen" "mintcream" "aquamarine" "turquoise" \
    "seagreen" "lightseagreen" "springgreen" "aliceblue" "azure" "white" \
    "lightcyan" "lightblue" "powderblue" "lightsteelblue" "lightslategray" \
    "slategray" "paleturquoise" "lightskyblue" "skyblue" "cadetblue" "grey" \
    "darkslategray" "cornflowerblue" "steelblue" "royalblue" "dodgerblue" \
    "deepskyblue" "darkturquoise" "ghostwhite" "lavender" "lightslateblue" \
    "orange" "slateblue" "darkslateblue" "midnightblue" "mediumblue" \
    "navyblue" "thistle" "plum" "orchid" "blueviolet" "purple" "violet" \
    "darkorchid" "darkviolet" "lavenderblush" "pink" "lightpink" \
    "palevioletred" "hotpink" "maroon" "violetred" "deeppink" \
    ]

set regwidth_icons [list [image create photo -file "$ds9_hack_root/UI/lw1.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw1.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw2.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw3.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw4.png" ] ]




proc setup_left_button_bar {} {
    global ds9
    global current
    global marker

    if { [winfo exists $ds9(main).hack_left] } {
        return
    }

    ttk::frame $ds9(main).hack_left
    set ds9(hack_left) $ds9(main).hack_left

    # Edit menu icons
    setup_edit_menu_icons
    pack $ds9(hack_left).edit_menu -side top -fill x


    setup_shape_icons
    pack $ds9(hack_left).shapes -side top -fill x
    pack $ds9(hack_left).info -side top -fill x
    pack $ds9(hack_left).list -side top -fill x 
    pack $ds9(hack_left).open -side top -fill x 
    pack $ds9(hack_left).save -side top -fill x 

    setup_region_color_icons
    pack $ds9(hack_left).colors -side top -fill x

    # width
    setup_region_width_icons
    pack $ds9(main).hack_left.size -side top -fill x
    
    # state/layer/others
    setup_region_prop_icons
    
    pack $ds9(hack_left).src -side top -fill x
    pack $ds9(hack_left).inc -side top -fill x
    pack $ds9(hack_left).back -side top -fill x
    pack $ds9(hack_left).front -side top -fill x
    pack $ds9(hack_left).compose -side top -fill x
    pack $ds9(hack_left).dissolve -side top -fill x
    pack $ds9(hack_left).group -side top -fill x
    

    if { ![catch {package present tooltip}] } {
        tooltip::tooltip $ds9(hack_left).edit_menu "Edit Mode"
        tooltip::tooltip $ds9(hack_left).shapes "Region Shape"
        tooltip::tooltip $ds9(hack_left).info "Get Region Info" 
        tooltip::tooltip $ds9(hack_left).list "List Region"  
        tooltip::tooltip $ds9(hack_left).open "Load Region File"  
        tooltip::tooltip $ds9(hack_left).save "Save Region File"      
        tooltip::tooltip $ds9(hack_left).colors "Region Color"
        tooltip::tooltip $ds9(hack_left).size "Region Line Width"
        tooltip::tooltip $ds9(hack_left).src "Toggle Source/Background"
        tooltip::tooltip $ds9(hack_left).inc "Toggle Include/Exclude"
        tooltip::tooltip $ds9(hack_left).back "Send to Back"
        tooltip::tooltip $ds9(hack_left).front "Bring to Front"
        tooltip::tooltip $ds9(hack_left).compose "Create Composite Region"
        tooltip::tooltip $ds9(hack_left).dissolve "Dissolve Composite Region"
        tooltip::tooltip $ds9(hack_left).group "Tag New Region Group"
    }


    trace add variable current(mode) write "sync_edit_mode"
    trace add variable marker(shape) write "sync_region_shape"

}


proc setup_edit_menu_icons {} {
    global ds9
    global edit_icons
 
    ttk::menubutton $ds9(hack_left).edit_menu -menu $ds9(hack_left).edit_menu.m \
      -text "Edit Mode"  -direction right \
      -image [lindex $edit_icons 1] -takefocus 0

    menu $ds9(hack_left).edit_menu.m -tearoff 0

    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {None}] -command "button_change_edit 0 none" \
        -image [lindex $edit_icons 0] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Region}] -command "button_change_edit 1 region" \
        -image [lindex $edit_icons 1] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Crosshair}] -command "button_change_edit 2 crosshair" \
        -image [lindex $edit_icons 2] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Colorbar}] -command "button_change_edit 3 colorbar" \
        -image [lindex $edit_icons 3] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Pan}] -command "button_change_edit 4 pan" \
        -image [lindex $edit_icons 4] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Zoom}] -command "button_change_edit 5 zoom" \
        -image [lindex $edit_icons 5] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Rotate}] -command "button_change_edit 6 rotate" \
        -image [lindex $edit_icons 6] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Crop}] -command "button_change_edit 7 crop" \
        -image [lindex $edit_icons 7] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Catalog}] -command "button_change_edit 8 catalog" \
        -image [lindex $edit_icons 8] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Footprint}] -command "button_change_edit 9 footprint" \
        -image [lindex $edit_icons 9] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {3D}] -command "button_change_edit 10 3d" \
        -image [lindex $edit_icons 10] -compound left
    $ds9(hack_left).edit_menu.m add command -label [msgcat::mc {Examine}] -command "button_change_edit 11 examine" \
        -image [lindex $edit_icons 11] -compound left




}

proc setup_shape_icons {} {
    global ds9
    global regionshape_icons    
    global ds9_hack_root

    ttk::menubutton $ds9(hack_left).shapes -menu $ds9(hack_left).shapes.m \
      -text "Region Shapes" -direction right \
      -image [lindex $regionshape_icons 0] -takefocus 0
      
    menu $ds9(hack_left).shapes.m -tearoff 0

    $ds9(hack_left).shapes.m add command -label [msgcat::mc {Circle}] \
        -command "button_change_marker 0 circle" \
        -image [lindex $regionshape_icons 0] -compound left

    $ds9(hack_left).shapes.m add command -label [msgcat::mc {Annulus}] \
        -command "button_change_marker 1 annulus" \
        -image [lindex $regionshape_icons 1] -compound left

    $ds9(hack_left).shapes.m add command -label [msgcat::mc {Ellipse}] \
        -command "button_change_marker 2 ellipse" \
        -image [lindex $regionshape_icons 2] -compound left

    $ds9(hack_left).shapes.m add command -label [msgcat::mc {Box}] \
        -command "button_change_marker 3 box" \
        -image [lindex $regionshape_icons 3] -compound left

    $ds9(hack_left).shapes.m add command -label [msgcat::mc {Polygon}] \
        -command "button_change_marker 4 polygon" \
        -image [lindex $regionshape_icons 4] -compound left

    $ds9(hack_left).shapes.m add command -label [msgcat::mc {Text}] \
        -command "button_change_marker 5 text" \
        -image [lindex $regionshape_icons 5] -compound left

    ttk::button $ds9(hack_left).info -text {Region Info} \
        -takefocus 0 -command {ds9Cmd "-region getinfo"} \
        -image [image create photo -file "$ds9_hack_root/UI/region_info.png"] 

    ttk::button $ds9(hack_left).list -text {Region List} \
        -takefocus 0 -command {ds9Cmd "-region list"} \
        -image [image create photo -file "$ds9_hack_root/UI/region_list.png"] 
        
    ttk::button $ds9(hack_left).open -text {Region Open} \
        -takefocus 0 -command MarkerLoad \
        -image [image create photo -file "$ds9_hack_root/UI/region_open.png"] 

    ttk::button $ds9(hack_left).save -text {Region Save} \
        -takefocus 0 -command [list MarkerSave {}] \
        -image [image create photo -file "$ds9_hack_root/UI/region_save.png"] 

}

proc setup_region_color_icons {} {
    
    global ds9
    global ds9_hack_root
    global color_icons
    global x11_colors
        
    set color_icons {}
    foreach clr $x11_colors {
      image create photo icon_$clr -file "$ds9_hack_root/UI/colors/$clr.png" 
      lappend color_icons icon_$clr      
    }

    ttk::menubutton $ds9(hack_left).colors -menu $ds9(hack_left).colors.m \
      -text "Region Color" -direction right \
      -image [make_color_button_image 11] -takefocus 0

    menu $ds9(hack_left).colors.m -tearoff 0

    for {set ii 0} { $ii < [llength $color_icons]} {incr ii} {

        set rr [expr $ii % 11]
        if { $rr == 0 } {
            set newcol 1
        } else {
            set newcol 0
        }

        $ds9(hack_left).colors.m add command \
          -label [lindex $x11_colors $ii] \
          -image [lindex $color_icons $ii] \
          -command "button_change_color $ii" \
          -columnbreak $newcol \
          -hidemargin 1 
    }

    
}

proc make_color_button_image { newval } {
  global color_icons

  image create photo clr_retval -height 22 -width 22
  set curimg [lindex $color_icons $newval]  

  clr_retval copy $curimg -zoom 2

  return clr_retval
}


proc setup_region_width_icons {} {
    global ds9
    global regwidth_icons

    ttk::menubutton $ds9(hack_left).size -menu $ds9(hack_left).size.m \
      -text "Region Width"  -direction right \
      -image [make_button_image 1] -takefocus 0
      
    menu $ds9(hack_left).size.m -tearoff 0

    $ds9(hack_left).size.m add command -label "1" -command "button_change_width 1" \
        -image [lindex $regwidth_icons 1] -compound left
    $ds9(hack_left).size.m add command -label "2" -command "button_change_width 2" \
        -image [lindex $regwidth_icons 2] -compound left
    $ds9(hack_left).size.m add command -label "3" -command "button_change_width 3" \
        -image [lindex $regwidth_icons 3] -compound left
    $ds9(hack_left).size.m add command -label "4" -command "button_change_width 4" \
        -image [lindex $regwidth_icons 4] -compound left
        
    
}


proc make_button_image { newval } {
  global ds9
  global regwidth_icons
  
  image create photo rw_retval -height 22 -width 22
  set curimg [lindex $regwidth_icons $newval]
  
  rw_retval copy $curimg -from 0 0 -to 0 5
  return rw_retval
}


proc setup_region_prop_icons {} {
    global ds9
    global ds9_hack_root
    
    ttk::button $ds9(hack_left).src -text {S/B} -takefocus 0 -command {button_change_srcbkg} \
        -image [image create photo -file "$ds9_hack_root/UI/srcbkg.png"]
    ttk::button $ds9(hack_left).inc -text {I/E} -takefocus 0 -command {button_change_incexl} \
        -image [image create photo -file "$ds9_hack_root/UI/incexl.png"]
    ttk::button $ds9(hack_left).back -text {Back} -takefocus 0 -command {MarkerBack } \
        -image [image create photo -file "$ds9_hack_root/UI/back.png"]
    ttk::button $ds9(hack_left).front -text {Front} -takefocus 0 -command {MarkerFront} \
        -image [image create photo -file "$ds9_hack_root/UI/front.png"]
    ttk::button $ds9(hack_left).compose -text {Composite} -takefocus 0 -command {CompositeCreate } \
        -image [image create photo -file "$ds9_hack_root/UI/region_compose.png"]
    ttk::button $ds9(hack_left).dissolve -text {Dissolve} -takefocus 0 -command {CompositeDelete} \
        -image [image create photo -file "$ds9_hack_root/UI/region_dissolve.png"]
    ttk::button $ds9(hack_left).group -text {Group} -takefocus 0 -command {GroupCreate} \
        -image [image create photo -file "$ds9_hack_root/UI/region_group.png"]
    
}


proc button_change_edit { newval cmd } {
  global marker
  global ds9
  global edit_icons
 
  ds9Cmd "-mode $cmd"

  $ds9(hack_left).edit_menu configure -text $newval \
    -image [lindex $edit_icons $newval]

}

proc button_change_marker { newval iswhat } {
  global marker
  global ds9
  global regionshape_icons

  if { $iswhat != "other" } {
    set marker(shape) $iswhat
  }

  $ds9(hack_left).shapes configure -text $newval \
  -image [lindex $regionshape_icons $newval]

}

proc button_change_color {newval} {
  global marker
  global x11_colors
  global color_icons
  global ds9
  
  set color [lindex $x11_colors $newval]
  set marker(color) $color
  MarkerColor 

  $ds9(hack_left).colors configure \
    -image [make_color_button_image $newval]
}

proc button_change_width { newval } {
  global marker
  global ds9
  global regwidth_icons
 
  set marker(width) $newval

  $ds9(main).hack_left.size configure -text $newval \
  -image [make_button_image $newval]

  MarkerWidth
}

proc button_change_srcbkg {} {
    global marker

    if { $marker(source) == 0 } {
        set marker(source) 1
    } else {
        set marker(source) 0
    }

    MarkerProp source

}


proc button_change_incexl {} {
    global marker

    if { $marker(include) == 0 } {
        set marker(include) 1
    } else {
        set marker(include) 0
    }

    MarkerProp include
    
}



proc sync_edit_mode {name1 name2 op} {
    global current

    switch $current(mode) {
        none      {button_change_edit 0 $current(mode)}
        region    {button_change_edit 1 $current(mode)}
        crosshair {button_change_edit 2 $current(mode)}
        colorbar  {button_change_edit 3 $current(mode)}
        pan       {button_change_edit 4 $current(mode)}  
        zoom      {button_change_edit 5 $current(mode)}
        rotate    {button_change_edit 6 $current(mode)}
        crop      {button_change_edit 7 $current(mode)}
        catalog   {button_change_edit 8 $current(mode)}
        footprint {button_change_edit 9 $current(mode)}
        examine   {button_change_edit 10 $current(mode)}
        3d        {button_change_edit 11 $current(mode)}
    }


}

proc sync_region_shape {name1 name2 op} {
    global marker

    switch $marker(shape) {
        circle       {button_change_marker 0 $marker(shape)}
        annulus      {button_change_marker 1 $marker(shape)}
        ellipse      {button_change_marker 2 $marker(shape)}
        box          {button_change_marker 3 $marker(shape)}
        polygon      {button_change_marker 4 $marker(shape)}
        text         {button_change_marker 5 $marker(shape)}
        default      {button_change_marker 6 other}
    }


}
