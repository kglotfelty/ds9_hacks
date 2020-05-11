
proc my_change_color {color} {
  global marker

  set marker(color) $color
  MarkerColor 

}


ttk::frame $ds9(main).quick.colors
grid $ds9(main).quick.colors -row 0 -column $atcol -padx 5
incr atcol

button $ds9(main).quick.colors.blk -text {Back} -takefocus 0 -command { my_change_color black } \
    -image [image create photo -file "$ds9_hack_root/UI/blk.png"]
button $ds9(main).quick.colors.wht -text {Back} -takefocus 0 -command { my_change_color white } \
    -image [image create photo -file "$ds9_hack_root/UI/wht.png"]
button $ds9(main).quick.colors.red -text {Back} -takefocus 0 -command { my_change_color red } \
    -image [image create photo -file "$ds9_hack_root/UI/red.png"]
button $ds9(main).quick.colors.grn -text {Back} -takefocus 0 -command { my_change_color green } \
    -image [image create photo -file "$ds9_hack_root/UI/grn.png"]
button $ds9(main).quick.colors.blu -text {Back} -takefocus 0 -command { my_change_color blue } \
    -image [image create photo -file "$ds9_hack_root/UI/blu.png"]
button $ds9(main).quick.colors.cyn -text {Back} -takefocus 0 -command { my_change_color cyan } \
    -image [image create photo -file "$ds9_hack_root/UI/cyn.png"]
button $ds9(main).quick.colors.pur -text {Back} -takefocus 0 -command { my_change_color magenta } \
    -image [image create photo -file "$ds9_hack_root/UI/pur.png"]
button $ds9(main).quick.colors.yel -text {Back} -takefocus 0 -command { my_change_color yellow } \
    -image [image create photo -file "$ds9_hack_root/UI/yel.png"]


grid $ds9(main).quick.colors.blk -row 0 -column 0
grid $ds9(main).quick.colors.red -row 0 -column 1
grid $ds9(main).quick.colors.grn -row 0 -column 2
grid $ds9(main).quick.colors.blu -row 0 -column 3
grid $ds9(main).quick.colors.wht -row 1 -column 0
grid $ds9(main).quick.colors.cyn -row 1 -column 1
grid $ds9(main).quick.colors.pur -row 1 -column 2
grid $ds9(main).quick.colors.yel -row 1 -column 3

