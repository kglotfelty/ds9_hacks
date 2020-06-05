
global x11_colors
global color_icons
set x11_colors [list \
"red"                 "antiquewhite"        "aquamarine"          "azure"               "beige" \
"bisque"              "lightyellow"         "blanchedalmond"      "darkolivegreen"      "blueviolet" \
"brown"               "green"               "cadetblue"           "chartreuse"          "chocolate" \
"coral"               "cornflowerblue"      "cornsilk"            "dimgray"             "darkgoldenrod" \
"darkgreen"           "darkkhaki"           "blue"                "darkorange"          "darkorchid" \
"darksalmon"          "darkseagreen"        "darkslateblue"       "darkslategray"       "darkturquoise" \
"darkviolet"          "deeppink"            "deepskyblue"         "cyan"                "dodgerblue" \
"floralwhite"         "forestgreen"         "gainsboro"           "ghostwhite"          "gold" \
"goldenrod"           "burlywood"           "greenyellow"         "peachpuff"           "magenta" \
"hotpink"             "indianred"           "ivory"               "khaki"               "lavender" \
"lavenderblush"       "lawngreen"           "lemonchiffon"        "lightblue"           "lightcoral" \
"yellow"              "lightgoldenrod"      "lightgoldenrodyellow" "lightgray"          "lightpink" \
"lightsalmon"         "lightseagreen"       "lightskyblue"        "lightslateblue"      "lightslategray" \
"lightsteelblue"      "black"               "limegreen"           "linen"               "honeydew" \
"maroon"              "mediumblue"          "midnightblue"        "mintcream"           "mistyrose" \
"moccasin"            "navajowhite"         "white"               "oldlace"             "olivedrab" \
"sandybrown"          "orangered"           "orchid"              "palegoldenrod"       "palegreen" \
"paleturquoise"       "palevioletred"       "papayawhip"          "grey"                "peru" \
"pink"                "plum"                "powderblue"          "purple"              "aliceblue" \
"rosybrown"           "royalblue"           "saddlebrown"         "salmon"              "orange" \
"seagreen"            "seashell"            "sienna"              "skyblue"             "slateblue" \
"slategray"           "snow"                "springgreen"         "steelblue"           "tan" \
"violet"              "tomato"              "turquoise"           "thistle"             "violetred" \
"wheat"               "navyblue"            "whitesmoke"          "lightcyan"           "yellowgreen" \
"indianred2"
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
grid $ds9(main).hack.quick.colors -row 0 -column $atcol -padx 5
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






#~ button $ds9(main).hack.quick.colors.blk -text {Back} -relief flat -bd 0 -takefocus 0 -command { my_change_color black } \
    #~ -image [image create photo -file "$ds9_hack_root/UI/blk.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
#~ button $ds9(main).hack.quick.colors.wht -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color white } \
    #~ -image [image create photo -file "$ds9_hack_root/UI/wht.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
#~ button $ds9(main).hack.quick.colors.red -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color red } \
    #~ -image [image create photo -file "$ds9_hack_root/UI/red.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
#~ button $ds9(main).hack.quick.colors.grn -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color green } \
    #~ -image [image create photo -file "$ds9_hack_root/UI/grn.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
#~ button $ds9(main).hack.quick.colors.blu -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color blue } \
    #~ -image [image create photo -file "$ds9_hack_root/UI/blu.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
#~ button $ds9(main).hack.quick.colors.cyn -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color cyan } \
    #~ -image [image create photo -file "$ds9_hack_root/UI/cyn.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
#~ button $ds9(main).hack.quick.colors.pur -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color magenta } \
    #~ -image [image create photo -file "$ds9_hack_root/UI/pur.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
#~ button $ds9(main).hack.quick.colors.yel -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color yellow } \
    #~ -image [image create photo -file "$ds9_hack_root/UI/yel.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat


#~ grid $ds9(main).hack.quick.colors.blk -row 0 -column 0 -padx 0 -pady 0 -ipadx 0 -ipady 0
#~ grid $ds9(main).hack.quick.colors.red -row 0 -column 1
#~ grid $ds9(main).hack.quick.colors.grn -row 0 -column 2
#~ grid $ds9(main).hack.quick.colors.blu -row 0 -column 3
#~ grid $ds9(main).hack.quick.colors.wht -row 1 -column 0
#~ grid $ds9(main).hack.quick.colors.cyn -row 1 -column 1
#~ grid $ds9(main).hack.quick.colors.pur -row 1 -column 2
#~ grid $ds9(main).hack.quick.colors.yel -row 1 -column 3

