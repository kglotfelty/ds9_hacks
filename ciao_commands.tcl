
ttk::frame $ds9(main).hack.quick.ciao
grid $ds9(main).hack.quick.ciao -row 0 -column $atcol -padx 5
incr atcol
ttk::button $ds9(main).hack.quick.ciao.pi -text {P} -takefocus 0 -command {ds9Cmd "-analysis task PI"} \
   -image [image create photo -file "$ds9_hack_root/UI/spectrum.png"]
ttk::button $ds9(main).hack.quick.ciao.time -text {T} -takefocus 0 -command {ds9Cmd "-analysis task TIME"} \
   -image [image create photo -file "$ds9_hack_root/UI/lightcurve.png"]
ttk::button $ds9(main).hack.quick.ciao.glvary -text {G} -takefocus 0 -command {ds9Cmd "-analysis task {Gregory-Loredo Lightcurve}"} \
   -image [image create photo -file "$ds9_hack_root/UI/glvary.png"]

ttk::button $ds9(main).hack.quick.ciao.stats -text {E} -takefocus 0 -command {ds9Cmd "-analysis task {Statistics (dmstat)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/stats.png"]

ttk::button $ds9(main).hack.quick.ciao.flux -text {F} -takefocus 0 -command {ds9Cmd "-analysis task {Net Counts}"} \
   -image [image create photo -file "$ds9_hack_root/UI/flux.png"]

ttk::button $ds9(main).hack.quick.ciao.coords -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Chandra Coordinates}"} \
   -image [image create photo -file "$ds9_hack_root/UI/coords.png"]

grid $ds9(main).hack.quick.ciao.pi -row 0 -column 0
grid $ds9(main).hack.quick.ciao.time -row 0 -column 1
grid $ds9(main).hack.quick.ciao.glvary -row 0 -column 2
grid $ds9(main).hack.quick.ciao.stats -row 0 -column 3
grid $ds9(main).hack.quick.ciao.flux -row 0 -column 4
grid $ds9(main).hack.quick.ciao.coords -row 0 -column 5

