
global regwidth_icons
set regwidth_icons [list [image create photo -file "$ds9_hack_root/UI/lw1.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw1.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw2.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw3.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw4.png" ] ]


proc my_change_width { newval } {
  global marker
  global ds9
  global regwidth_icons
 
  set marker(width) $newval
  $ds9(main).quick.size.at configure -text $newval \
  -image [lindex $regwidth_icons $newval]
  MarkerWidth
}

ttk::frame $ds9(main).quick.size 
grid $ds9(main).quick.size -row 0 -column $atcol
incr atcol

ttk::menubutton $ds9(main).quick.size.at -menu $ds9(main).quick.size.at.m \
  -text "Region Width" \
  -image [lindex $regwidth_icons 1]
  
menu $ds9(main).quick.size.at.m -tearoff 0

$ds9(main).quick.size.at.m add command -label "1" -command "my_change_width 1" \
    -image [lindex $regwidth_icons 1]
$ds9(main).quick.size.at.m add command -label "2" -command "my_change_width 2" \
    -image [lindex $regwidth_icons 2]
$ds9(main).quick.size.at.m add command -label "3" -command "my_change_width 3" \
    -image [lindex $regwidth_icons 3]
$ds9(main).quick.size.at.m add command -label "4" -command "my_change_width 4" \
    -image [lindex $regwidth_icons 4]

grid $ds9(main).quick.size.at -row 0 -column 0



