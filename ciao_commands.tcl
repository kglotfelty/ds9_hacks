
ttk::frame $ds9(main).hack.quick_three.ciao
pack $ds9(main).hack.quick_three.ciao -padx 5
pack configure $ds9(main).hack.quick_three.ciao -side left


ttk::button $ds9(main).hack.quick_three.ciao.pi -text {P} -takefocus 0 -command {ds9Cmd "-analysis task PI"} \
   -image [image create photo -file "$ds9_hack_root/UI/spectrum.png"]
ttk::button $ds9(main).hack.quick_three.ciao.time -text {T} -takefocus 0 -command {ds9Cmd "-analysis task TIME"} \
   -image [image create photo -file "$ds9_hack_root/UI/lightcurve.png"]
ttk::button $ds9(main).hack.quick_three.ciao.glvary -text {G} -takefocus 0 -command {ds9Cmd "-analysis task {Gregory-Loredo Lightcurve}"} \
   -image [image create photo -file "$ds9_hack_root/UI/glvary.png"]

ttk::button $ds9(main).hack.quick_three.ciao.stats -text {E} -takefocus 0 -command {ds9Cmd "-analysis task {Statistics (dmstat)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/stats.png"]

ttk::button $ds9(main).hack.quick_three.ciao.netcts -text {F} -takefocus 0 -command {ds9Cmd "-analysis task {Net Counts}"} \
   -image [image create photo -file "$ds9_hack_root/UI/net.png"]

ttk::button $ds9(main).hack.quick_three.ciao.flux -text {F} -takefocus 0 -command {ds9Cmd "-analysis task {Photometry (srcflux)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/flux.png"]

ttk::button $ds9(main).hack.quick_three.ciao.coords -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Chandra Coordinates}"} \
   -image [image create photo -file "$ds9_hack_root/UI/coords.png"]

## -- Sherpa

ttk::button $ds9(main).hack.quick_three.ciao.specfit -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Spectral Fit}"} \
   -image [image create photo -file "$ds9_hack_root/UI/specfit.png"]

ttk::button $ds9(main).hack.quick_three.ciao.imgfit -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {2D Image Fit}"} \
   -image [image create photo -file "$ds9_hack_root/UI/imgfit.png"]



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

ttk::button $ds9(main).hack.quick_three.ciao.filth -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Source Fill}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmfilth.png"]




ttk::button $ds9(main).hack.quick_three.ciao.thresh -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Threshold}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmimgthresh.png"]
ttk::button $ds9(main).hack.quick_three.ciao.imgfilt -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Non-Linear Filter}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmimgfilt.png"]
ttk::button $ds9(main).hack.quick_three.ciao.imgadapt -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Adaptive Smooth}"} \
   -image [image create photo -file "$ds9_hack_root/UI/adaptive_smooth.png"]
ttk::button $ds9(main).hack.quick_three.ciao.csmooth -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Csmooth}"} \
   -image [image create photo -file "$ds9_hack_root/UI/csmooth.png"]
ttk::button $ds9(main).hack.quick_three.ciao.nautilus -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Adaptive Bin}"} \
   -image [image create photo -file "$ds9_hack_root/UI/adaptive_bin.png"]
ttk::button $ds9(main).hack.quick_three.ciao.lasso -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Lasso}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmimglasso.png"]
ttk::button $ds9(main).hack.quick_three.ciao.ellipse -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {Ellipse}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmellipse.png"]



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
   
# Crop
# Convex Hull

pack $ds9(main).hack.quick_three.ciao.pi -side left
pack $ds9(main).hack.quick_three.ciao.time -side left
pack $ds9(main).hack.quick_three.ciao.glvary -side left
pack $ds9(main).hack.quick_three.ciao.pfold -side left

pack $ds9(main).hack.quick_three.ciao.specfit -padx {15 0} -side left
pack $ds9(main).hack.quick_three.ciao.imgfit  -side left


pack $ds9(main).hack.quick_three.ciao.stats -padx {15 0} -side left
pack $ds9(main).hack.quick_three.ciao.netcts  -side left
pack $ds9(main).hack.quick_three.ciao.flux  -side left
pack $ds9(main).hack.quick_three.ciao.coords  -side left

pack $ds9(main).hack.quick_three.ciao.imghist  -padx {15 0} -side left
pack $ds9(main).hack.quick_three.ciao.rprof  -side left

pack $ds9(main).hack.quick_three.ciao.wav  -padx {15 0} -side left
pack $ds9(main).hack.quick_three.ciao.cel  -side left
pack $ds9(main).hack.quick_three.ciao.vtp  -side left

pack $ds9(main).hack.quick_three.ciao.filth  -padx {15 0} -side left
pack $ds9(main).hack.quick_three.ciao.thresh -side left
pack $ds9(main).hack.quick_three.ciao.imgfilt -side left
pack $ds9(main).hack.quick_three.ciao.imgadapt -side left
pack $ds9(main).hack.quick_three.ciao.csmooth -side left
pack $ds9(main).hack.quick_three.ciao.nautilus -side left

pack $ds9(main).hack.quick_three.ciao.lasso -side left -padx {15 0}
pack $ds9(main).hack.quick_three.ciao.ellipse -side left



pack $ds9(main).hack.quick_three.ciao.calc_add  -padx {15 0} -side left
pack $ds9(main).hack.quick_three.ciao.calc_sub  -side left
pack $ds9(main).hack.quick_three.ciao.calc_mul  -side left
pack $ds9(main).hack.quick_three.ciao.calc_div  -side left
