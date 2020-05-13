
global regdash_icons
set regdash_icons [list [image create photo -file "$ds9_hack_root/UI/1_0.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/2_2.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/2_4.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/2_6.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/2_8.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/2_10.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/4_2.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/4_4.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/4_6.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/4_8.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/4_10.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/6_2.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/6_4.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/6_6.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/6_8.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/6_10.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/8_2.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/8_4.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/8_6.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/8_8.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/8_10.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/10_2.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/10_4.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/10_6.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/10_8.png" ] \
                        [image create photo -file "$ds9_hack_root/UI/10_10.png" ] ]

proc my_change_dash { nidx ndash ngap } {
  global ds9
  global regdash_icons
  global env  
  exec $env(HOME)/ds9_hacks/dashlist.py $ds9(title) $ndash $ngap &
  $ds9(main).quick.dashes.at configure -text $nidx \
    -image [lindex $regdash_icons $nidx]
}

ttk::frame $ds9(main).quick.dashes 
grid $ds9(main).quick.dashes -row 0 -column $atcol
incr atcol

ttk::menubutton $ds9(main).quick.dashes.at -menu $ds9(main).quick.dashes.at.m \
  -text "Region Dashes" \
  -image [lindex $regdash_icons 0]
  
menu $ds9(main).quick.dashes.at.m -tearoff 0

$ds9(main).quick.dashes.at.m add command -label "1" -command "my_change_dash 0 32767 1" \
    -image [lindex $regdash_icons 0]
$ds9(main).quick.dashes.at.m add command -label "2" -command "my_change_dash 1 2 2" \
    -image [lindex $regdash_icons 1]
$ds9(main).quick.dashes.at.m add command -label "3" -command "my_change_dash 2 2 4" \
    -image [lindex $regdash_icons 2]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 3 2 6" \
    -image [lindex $regdash_icons 3]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 4 2 8" \
    -image [lindex $regdash_icons 4]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 5 2 10" \
    -image [lindex $regdash_icons 5]

$ds9(main).quick.dashes.at.m add command -label "2" -command "my_change_dash 6 8 2" \
    -image [lindex $regdash_icons 6]
$ds9(main).quick.dashes.at.m add command -label "3" -command "my_change_dash 7 8 4" \
    -image [lindex $regdash_icons 7]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 8 8 6" \
    -image [lindex $regdash_icons 8]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 8 8 8" \
    -image [lindex $regdash_icons 9]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 10 8 10" \
    -image [lindex $regdash_icons 10]

$ds9(main).quick.dashes.at.m add command -label "2" -command "my_change_dash 11 6 2" \
    -image [lindex $regdash_icons 11]
$ds9(main).quick.dashes.at.m add command -label "3" -command "my_change_dash 12 6 4" \
    -image [lindex $regdash_icons 12]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 13 6 6" \
    -image [lindex $regdash_icons 13]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 14 6 8" \
    -image [lindex $regdash_icons 14]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 15 6 10" \
    -image [lindex $regdash_icons 15]

$ds9(main).quick.dashes.at.m add command -label "2" -command "my_change_dash 16 8 2" \
    -image [lindex $regdash_icons 16]
$ds9(main).quick.dashes.at.m add command -label "3" -command "my_change_dash 17 8 4" \
    -image [lindex $regdash_icons 17]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 18 8 6" \
    -image [lindex $regdash_icons 18]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 19 8 8" \
    -image [lindex $regdash_icons 19]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 20 8 10" \
    -image [lindex $regdash_icons 20]

$ds9(main).quick.dashes.at.m add command -label "2" -command "my_change_dash 21 10 2" \
    -image [lindex $regdash_icons 21]
$ds9(main).quick.dashes.at.m add command -label "3" -command "my_change_dash 22 10 4" \
    -image [lindex $regdash_icons 22]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 23 10 6" \
    -image [lindex $regdash_icons 23]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 24 10 8" \
    -image [lindex $regdash_icons 24]
$ds9(main).quick.dashes.at.m add command -label "4" -command "my_change_dash 25 10 10" \
    -image [lindex $regdash_icons 25]


grid $ds9(main).quick.dashes.at -row 0 -column 0










#~ # Note: & below to put in background so xpa isn't blocked

#~ button $ds9(main).quick.dashes.8x3 -text {8x3} -takefocus 0 -command {exec $env(HOME)/ds9_hacks/dashlist.py $ds9(title) 8 3 &} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/8_3.png"] -borderwidth 0 -pady 0
#~ button $ds9(main).quick.dashes.2x2 -text {8x3} -takefocus 0 -command {exec $env(HOME)/ds9_hacks/dashlist.py $ds9(title) 2 2 &} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/2_2.png"] -borderwidth 0 -pady 0
#~ button $ds9(main).quick.dashes.10x4 -text {8x3} -takefocus 0 -command {exec $env(HOME)/ds9_hacks/dashlist.py $ds9(title) 10 4 &} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/10_4.png"] -borderwidth 0 -pady 0
#~ button $ds9(main).quick.dashes.5x5 -text {8x3} -takefocus 0 -command {exec $env(HOME)/ds9_hacks/dashlist.py $ds9(title) 5 5 &} \
    #~ -image [image create photo -file "$ds9_hack_root/UI/5_5.png"] -borderwidth 0 -pady 0

#~ grid $ds9(main).quick.dashes.8x3 -row 0 -column 0
#~ grid $ds9(main).quick.dashes.2x2 -row 1 -column 0
#~ grid $ds9(main).quick.dashes.10x4 -row 2 -column 0
#~ grid $ds9(main).quick.dashes.5x5 -row 3 -column 0

