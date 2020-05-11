ds9Cmd "-analysis $ds9_hack_root/dashes.ans"

ttk::frame $ds9(main).quick.dashes
grid $ds9(main).quick.dashes -row 0 -column $atcol -padx 5
incr atcol

button $ds9(main).quick.dashes.8x3 -text {8x3} -takefocus 0 -command {ds9Cmd "-analysis task dash8x3"} \
    -image [image create photo -file "$ds9_hack_root/UI/8_3.png"] -borderwidth 0 -pady 0
button $ds9(main).quick.dashes.2x2 -text {8x3} -takefocus 0 -command {ds9Cmd "-analysis task dash2x2"} \
    -image [image create photo -file "$ds9_hack_root/UI/2_2.png"] -borderwidth 0 -pady 0
button $ds9(main).quick.dashes.10x4 -text {8x3} -takefocus 0 -command {ds9Cmd "-analysis task dash10x4"} \
    -image [image create photo -file "$ds9_hack_root/UI/10_4.png"] -borderwidth 0 -pady 0
button $ds9(main).quick.dashes.5x5 -text {8x3} -takefocus 0 -command {ds9Cmd "-analysis task dash5x5"} \
    -image [image create photo -file "$ds9_hack_root/UI/5_5.png"] -borderwidth 0 -pady 0

grid $ds9(main).quick.dashes.8x3 -row 0 -column 0
grid $ds9(main).quick.dashes.2x2 -row 1 -column 0
grid $ds9(main).quick.dashes.10x4 -row 2 -column 0
grid $ds9(main).quick.dashes.5x5 -row 3 -column 0

