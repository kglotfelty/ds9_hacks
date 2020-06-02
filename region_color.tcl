
proc my_change_color {color} {
  global marker

  set marker(color) $color
  MarkerColor 

}


ttk::frame $ds9(main).hack.quick.colors
grid $ds9(main).hack.quick.colors -row 0 -column $atcol -padx 5
incr atcol

button $ds9(main).hack.quick.colors.blk -text {Back} -relief flat -bd 0 -takefocus 0 -command { my_change_color black } \
    -image [image create photo -file "$ds9_hack_root/UI/blk.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
button $ds9(main).hack.quick.colors.wht -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color white } \
    -image [image create photo -file "$ds9_hack_root/UI/wht.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
button $ds9(main).hack.quick.colors.red -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color red } \
    -image [image create photo -file "$ds9_hack_root/UI/red.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
button $ds9(main).hack.quick.colors.grn -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color green } \
    -image [image create photo -file "$ds9_hack_root/UI/grn.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
button $ds9(main).hack.quick.colors.blu -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color blue } \
    -image [image create photo -file "$ds9_hack_root/UI/blu.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
button $ds9(main).hack.quick.colors.cyn -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color cyan } \
    -image [image create photo -file "$ds9_hack_root/UI/cyn.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
button $ds9(main).hack.quick.colors.pur -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color magenta } \
    -image [image create photo -file "$ds9_hack_root/UI/pur.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat
button $ds9(main).hack.quick.colors.yel -text {Back} -relief flat -bd 0  -takefocus 0 -command { my_change_color yellow } \
    -image [image create photo -file "$ds9_hack_root/UI/yel.png"] -padx 0 -pady 0 -highlightthickness 0 -overrelief flat


grid $ds9(main).hack.quick.colors.blk -row 0 -column 0 -padx 0 -pady 0 -ipadx 0 -ipady 0
grid $ds9(main).hack.quick.colors.red -row 0 -column 1
grid $ds9(main).hack.quick.colors.grn -row 0 -column 2
grid $ds9(main).hack.quick.colors.blu -row 0 -column 3
grid $ds9(main).hack.quick.colors.wht -row 1 -column 0
grid $ds9(main).hack.quick.colors.cyn -row 1 -column 1
grid $ds9(main).hack.quick.colors.pur -row 1 -column 2
grid $ds9(main).hack.quick.colors.yel -row 1 -column 3

