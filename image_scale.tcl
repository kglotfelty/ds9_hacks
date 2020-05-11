
ttk::frame $ds9(main).quick.scale
grid $ds9(main).quick.scale -row 0 -column $atcol -padx 5
incr atcol
ttk::button $ds9(main).quick.scale.log -text {ln} -takefocus 0 -command {ds9Cmd "-scale log"} \
   -image [image create photo -file "$ds9_hack_root/UI/log.png"]
ttk::button $ds9(main).quick.scale.lin -text {lin} -takefocus 0 -command {ds9Cmd "-scale linear"} \
   -image [image create photo -file "$ds9_hack_root/UI/lin.png"]
ttk::button $ds9(main).quick.scale.pow -text {pow} -takefocus 0 -command {ds9Cmd "-scale pow" } \
   -image [image create photo -file "$ds9_hack_root/UI/pow.png"]
grid $ds9(main).quick.scale.log -row 0 -column 0 
grid $ds9(main).quick.scale.lin -row 0 -column 1 
grid $ds9(main).quick.scale.pow -row 0 -column 2 


