frame $ds9(main).quick.layer
grid $ds9(main).quick.layer -row 0 -column $atcol -columnspan 1 -padx 5
incr atcol
button $ds9(main).quick.layer.back -text {Back} -takefocus 0 -command {MarkerBack } \
    -image [image create photo -file "$ds9_hack_root/UI/back.png"]
button $ds9(main).quick.layer.front -text {Front} -takefocus 0 -command {MarkerFront} \
    -image [image create photo -file "$ds9_hack_root/UI/front.png"]

grid $ds9(main).quick.layer.back -row 0 -column 0
grid $ds9(main).quick.layer.front -row 0 -column 1
