
ttk::frame $ds9(main).hack.quick_three.ciao
grid $ds9(main).hack.quick_three.ciao -row 0 -column $atcol -padx 5
incr atcol
ttk::button $ds9(main).hack.quick_three.ciao.pi -text {P} -takefocus 0 -command {ds9Cmd "-analysis task PI"} \
   -image [image create photo -file "$ds9_hack_root/UI/spectrum.png"]
ttk::button $ds9(main).hack.quick_three.ciao.time -text {T} -takefocus 0 -command {ds9Cmd "-analysis task TIME"} \
   -image [image create photo -file "$ds9_hack_root/UI/lightcurve.png"]
ttk::button $ds9(main).hack.quick_three.ciao.glvary -text {G} -takefocus 0 -command {ds9Cmd "-analysis task {Gregory-Loredo Lightcurve}"} \
   -image [image create photo -file "$ds9_hack_root/UI/glvary.png"]

ttk::button $ds9(main).hack.quick_three.ciao.stats -text {E} -takefocus 0 -command {ds9Cmd "-analysis task {Statistics (dmstat)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/stats.png"]

ttk::button $ds9(main).hack.quick_three.ciao.flux -text {F} -takefocus 0 -command {ds9Cmd "-analysis task {Net Counts}"} \
   -image [image create photo -file "$ds9_hack_root/UI/flux.png"]

ttk::button $ds9(main).hack.quick_three.ciao.coords -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Chandra Coordinates}"} \
   -image [image create photo -file "$ds9_hack_root/UI/coords.png"]


#~ pfold.png
ttk::button $ds9(main).hack.quick_three.ciao.pfold -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Period Fold}"} \
   -image [image create photo -file "$ds9_hack_root/UI/pfold.png"]

#~ pixel_histogram.png
ttk::button $ds9(main).hack.quick_three.ciao.imghist -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Pixel}"} \
   -image [image create photo -file "$ds9_hack_root/UI/pixel_histogram.png"]
#~ radial_prof.png
ttk::button $ds9(main).hack.quick_three.ciao.rprof -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Radial Profile}"} \
   -image [image create photo -file "$ds9_hack_root/UI/radial_prof.png"]

#~ mexhat.png
ttk::button $ds9(main).hack.quick_three.ciao.wav -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {wavdetect}"} \
   -image [image create photo -file "$ds9_hack_root/UI/mexhat.png"]
#~ cell.png
ttk::button $ds9(main).hack.quick_three.ciao.cel -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {celldetect}"} \
   -image [image create photo -file "$ds9_hack_root/UI/cell.png"]
#~ vtp.png
ttk::button $ds9(main).hack.quick_three.ciao.vtp -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {vtpdetect}"} \
   -image [image create photo -file "$ds9_hack_root/UI/vtp.png"]

#~ calc_add.png
ttk::button $ds9(main).hack.quick_three.ciao.calc_add -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {ADD: previous frame to current frame (c+p)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/calc_add.png"]
#~ calc_sub.png
ttk::button $ds9(main).hack.quick_three.ciao.calc_sub -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {SUB2: subtract current frame from previous (p-c)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/calc_sub.png"]
#~ calc_mul.png
ttk::button $ds9(main).hack.quick_three.ciao.calc_mul -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {MUL: multiply current and previous frame (c*p)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/calc_mul.png"]
#~ calc_div.png
ttk::button $ds9(main).hack.quick_three.ciao.calc_div -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {DIV2: divide previous frame by current (p/c)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/calc_div.png"]






grid $ds9(main).hack.quick_three.ciao.pi -row 0 -column 0
grid $ds9(main).hack.quick_three.ciao.time -row 0 -column 1
grid $ds9(main).hack.quick_three.ciao.glvary -row 0 -column 2
grid $ds9(main).hack.quick_three.ciao.stats -row 0 -column 3
grid $ds9(main).hack.quick_three.ciao.flux -row 0 -column 4
grid $ds9(main).hack.quick_three.ciao.coords -row 0 -column 5


grid $ds9(main).hack.quick_three.ciao.pfold -row 0 -column 6
grid $ds9(main).hack.quick_three.ciao.imghist -row 0 -column 7
grid $ds9(main).hack.quick_three.ciao.rprof -row 0 -column 8

grid $ds9(main).hack.quick_three.ciao.wav -row 0 -column 9
grid $ds9(main).hack.quick_three.ciao.cel -row 0 -column 10
grid $ds9(main).hack.quick_three.ciao.vtp -row 0 -column 11

grid $ds9(main).hack.quick_three.ciao.calc_add -row 0 -column 12
grid $ds9(main).hack.quick_three.ciao.calc_sub -row 0 -column 13
grid $ds9(main).hack.quick_three.ciao.calc_mul -row 0 -column 14
grid $ds9(main).hack.quick_three.ciao.calc_div -row 0 -column 15
