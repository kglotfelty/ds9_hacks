


global scale_icons
set scale_icons [ list [image create photo -file "$ds9_hack_root/UI/log.png"] \
                       [image create photo -file "$ds9_hack_root/UI/lin.png"] \
                       [image create photo -file "$ds9_hack_root/UI/pow.png"] \
                        ]


proc my_change_scale { newval iswhat } {
  global ds9
  global scale_icons

  ds9Cmd "-scale $iswhat"
  $ds9(main).hack_top.scale.at configure -text $newval \
    -image [lindex $scale_icons $newval]

}



ttk::frame $ds9(main).hack_top.scale 
pack $ds9(main).hack_top.scale -side left

ttk::menubutton $ds9(main).hack_top.scale.at -menu $ds9(main).hack_top.scale.at.m \
  -text "Region Width" \
  -image [lindex $scale_icons 0] -takefocus 0

ds9Cmd "-scale log"
 
menu $ds9(main).hack_top.scale.at.m -tearoff 0

$ds9(main).hack_top.scale.at.m add command -label "Log" \
    -command {my_change_scale 0 log} \
    -image [lindex $scale_icons 0] -compound left

$ds9(main).hack_top.scale.at.m add command -label "Linear" \
    -command {my_change_scale 1 linear} \
    -image [lindex $scale_icons 1] -compound left

$ds9(main).hack_top.scale.at.m add command -label "Power" \
    -command {my_change_scale 2 pow} \
    -image [lindex $scale_icons 2] -compound left


grid $ds9(main).hack_top.scale.at -row 0 -column 0
