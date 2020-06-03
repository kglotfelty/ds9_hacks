


global scale_icons
set scale_icons [ list [image create photo -file "$ds9_hack_root/UI/log.png"] \
                       [image create photo -file "$ds9_hack_root/UI/lin.png"] \
                       [image create photo -file "$ds9_hack_root/UI/pow.png"] \
                        ]


proc my_change_scale { newval iswhat } {
  global ds9
  global scale_icons

  ds9Cmd "-scale $iswhat"
  $ds9(main).hack.quick.scale.at configure -text $newval \
    -image [lindex $scale_icons $newval]

}



ttk::frame $ds9(main).hack.quick.scale 
grid $ds9(main).hack.quick.scale -row 0 -column $atcol
incr atcol

ttk::menubutton $ds9(main).hack.quick.scale.at -menu $ds9(main).hack.quick.scale.at.m \
  -text "Region Width" \
  -image [lindex $scale_icons 0] -takefocus 0

ds9Cmd "-scale log"
 
menu $ds9(main).hack.quick.scale.at.m -tearoff 0

$ds9(main).hack.quick.scale.at.m add command -label "1" \
    -command {my_change_scale 0 log} \
    -image [lindex $scale_icons 0]

$ds9(main).hack.quick.scale.at.m add command -label "1" \
    -command {my_change_scale 1 linear} \
    -image [lindex $scale_icons 1]

$ds9(main).hack.quick.scale.at.m add command -label "1" \
    -command {my_change_scale 2 pow} \
    -image [lindex $scale_icons 2]


grid $ds9(main).hack.quick.scale.at -row 0 -column 0




#~ ttk::frame $ds9(main).hack.quick.scale
#~ grid $ds9(main).hack.quick.scale -row 0 -column $atcol -padx 5
#~ incr atcol
#~ ttk::button $ds9(main).hack.quick.scale.log -text {ln} -takefocus 0 -command {ds9Cmd "-scale log"} \
   #~ -image [image create photo -file "$ds9_hack_root/UI/log.png"]
#~ ttk::button $ds9(main).hack.quick.scale.lin -text {lin} -takefocus 0 -command {ds9Cmd "-scale linear"} \
   #~ -image [image create photo -file "$ds9_hack_root/UI/lin.png"]
#~ ttk::button $ds9(main).hack.quick.scale.pow -text {pow} -takefocus 0 -command {ds9Cmd "-scale pow" } \
   #~ -image [image create photo -file "$ds9_hack_root/UI/pow.png"]
#~ grid $ds9(main).hack.quick.scale.log -row 0 -column 0 
#~ grid $ds9(main).hack.quick.scale.lin -row 0 -column 1 
#~ grid $ds9(main).hack.quick.scale.pow -row 0 -column 2 


