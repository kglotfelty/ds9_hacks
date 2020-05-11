
ttk::frame $ds9(main).quick.ciao
grid $ds9(main).quick.ciao -row 0 -column $atcol -padx 5
incr atcol
ttk::button $ds9(main).quick.ciao.pi -text {P} -takefocus 0 -command {ds9Cmd "-analysis task PI"} \
   -image [image create photo -file "$ds9_hack_root/UI/spectrum.png"]
ttk::button $ds9(main).quick.ciao.time -text {T} -takefocus 0 -command {ds9Cmd "-analysis task TIME"} \
   -image [image create photo -file "$ds9_hack_root/UI/lightcurve.png"]
ttk::button $ds9(main).quick.ciao.glvary -text {G} -takefocus 0 -command {ds9Cmd "-analysis task {G-L Vary}"} \
   -image [image create photo -file "$ds9_hack_root/UI/glvary.png"]

ttk::button $ds9(main).quick.ciao.coords -text {E} -takefocus 0 -command {ds9Cmd "-analysis task {dmstat (no centroid)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/stats.png"]

ttk::button $ds9(main).quick.ciao.stats -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {All}"} \
   -image [image create photo -file "$ds9_hack_root/UI/coords.png"]

grid $ds9(main).quick.ciao.pi -row 0 -column 0
grid $ds9(main).quick.ciao.time -row 0 -column 1
grid $ds9(main).quick.ciao.glvary -row 0 -column 2
grid $ds9(main).quick.ciao.coords -row 0 -column 3
grid $ds9(main).quick.ciao.stats -row 0 -column 4

