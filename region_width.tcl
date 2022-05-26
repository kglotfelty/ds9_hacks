
global regwidth_icons
set regwidth_icons [list [image create photo -file "$ds9_hack_root/UI/lw1.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw1.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw2.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw3.png" ] \
                         [image create photo -file "$ds9_hack_root/UI/lw4.png" ] ]


proc make_button_image { newval } {
  global ds9
  global regwidth_icons
  
  image create photo rw_retval -height 22 -width 22
  set curimg [lindex $regwidth_icons $newval]
  
  rw_retval copy $curimg -from 0 0 -to 0 5
  return rw_retval
}



proc my_change_width { newval } {
  global marker
  global ds9
  global regwidth_icons
 
  set marker(width) $newval

  $ds9(main).hack_left.size.at configure -text $newval \
  -image [make_button_image $newval]

  MarkerWidth
}

ttk::frame $ds9(main).hack_left.size 
pack $ds9(main).hack_left.size -side top

ttk::menubutton $ds9(main).hack_left.size.at -menu $ds9(main).hack_left.size.at.m \
  -text "Region Width"  -direction right \
  -image [make_button_image 1] -takefocus 0
  
menu $ds9(main).hack_left.size.at.m -tearoff 0

$ds9(main).hack_left.size.at.m add command -label "1" -command "my_change_width 1" \
    -image [lindex $regwidth_icons 1] -compound left
$ds9(main).hack_left.size.at.m add command -label "2" -command "my_change_width 2" \
    -image [lindex $regwidth_icons 2] -compound left
$ds9(main).hack_left.size.at.m add command -label "3" -command "my_change_width 3" \
    -image [lindex $regwidth_icons 3] -compound left
$ds9(main).hack_left.size.at.m add command -label "4" -command "my_change_width 4" \
    -image [lindex $regwidth_icons 4] -compound left

grid $ds9(main).hack_left.size.at -row 0 -column 0



