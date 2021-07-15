
global x11_colors
global color_icons

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


# red green blue cyan magenta yellow black white grey orange violet
# aliceblue 


set color_icons {}
foreach clr $x11_colors {
  image create photo icon_$clr -file "$ds9_hack_root/UI/colors/$clr.png" 
  lappend color_icons icon_$clr      
}






proc my_change_color {newval} {
  global marker
  global x11_colors
  global color_icons
  global ds9
  
  set color [lindex $x11_colors $newval]
  set marker(color) $color
  MarkerColor 

  $ds9(main).hack.quick.colors.at configure \
    -image [make_color_button_image $newval]
}


proc make_color_button_image { newval } {
  global color_icons

  image create photo clr_retval -height 22 -width 22
  set curimg [lindex $color_icons $newval]  

  clr_retval copy $curimg -zoom 2

  return clr_retval
}




ttk::frame $ds9(main).hack.quick.colors
#~ grid $ds9(main).hack.quick.colors -row 0 -column $atcol -padx 5
pack $ds9(main).hack.quick.colors -padx 5 -side left
incr atcol



ttk::menubutton $ds9(main).hack.quick.colors.at -menu $ds9(main).hack.quick.colors.at.m \
  -text "Region Color" \
  -image [make_color_button_image 11] -takefocus 0

menu $ds9(main).hack.quick.colors.at.m -tearoff 0

grid $ds9(main).hack.quick.colors.at -row 0 -column 0




for {set ii 0} { $ii < [llength $color_icons]} {incr ii} {

    set rr [expr $ii % 11]
    if { $rr == 0 } {
        set newcol 1
    } else {
        set newcol 0
    }

    $ds9(main).hack.quick.colors.at.m add command \
      -label [lindex $x11_colors $ii] \
      -image [lindex $color_icons $ii] \
      -command "my_change_color $ii" \
      -columnbreak $newcol \
      -hidemargin 1 
    
}



