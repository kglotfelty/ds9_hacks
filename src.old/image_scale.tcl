


global scale_icons
set scale_icons [ list [image create photo -file "$ds9_hack_root/UI/log.png"] \
                       [image create photo -file "$ds9_hack_root/UI/lin.png"] \
                       [image create photo -file "$ds9_hack_root/UI/pow.png"] \
                       [image create photo -file "$ds9_hack_root/UI/scale_other.png"] \
                        ]


proc my_change_scale { newval iswhat } {
  global ds9
  global scale_icons

  if { $iswhat != "other" } {
    ds9Cmd "-scale $iswhat"
  }

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

$ds9(main).hack_top.scale.at.m add command -label [msgcat::mc {Log}] \
    -command {my_change_scale 0 log} \
    -image [lindex $scale_icons 0] -compound left

$ds9(main).hack_top.scale.at.m add command -label [msgcat::mc {Linear}] \
    -command {my_change_scale 1 linear} \
    -image [lindex $scale_icons 1] -compound left

$ds9(main).hack_top.scale.at.m add command -label [msgcat::mc {Power}] \
    -command {my_change_scale 2 pow} \
    -image [lindex $scale_icons 2] -compound left


pack $ds9(main).hack_top.scale.at -side left


ttk::button $ds9(main).hack_top.scale.limits -text {Scale Parameters} -takefocus 0\
  -command ScaleDialog \
  -image [image create photo -file "$ds9_hack_root/UI/scale_limits.png"] 
pack $ds9(main).hack_top.scale.limits -side left


if { ![catch {package require tooltip}] } {
    tooltip::tooltip $ds9(main).hack_top.scale.at "Scaling Option"
    tooltip::tooltip $ds9(main).hack_top.scale.limits "Scaling Parameters"
}


global scale

trace add variable scale(type) write "sync_scale_type"

proc sync_scale_type {name1 name2 op} {
    global scale

    switch $scale(type) {
        log      {my_change_scale 0 $scale(type)}
        linear   {my_change_scale 1 $scale(type)}
        pow      {my_change_scale 2 $scale(type)}
        default  {my_change_scale 3 other}
    }


}



