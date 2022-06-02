
ttk::frame $ds9(hack_top).ciao
pack $ds9(hack_top).ciao -padx 5
pack configure $ds9(hack_top).ciao -side left


ttk::button $ds9(hack_top).ciao.pi -text {PI Spectrum} -takefocus 0 -command {ds9Cmd "-analysis task PI"} \
   -image [image create photo -file "$ds9_hack_root/UI/spectrum.png"]
ttk::button $ds9(hack_top).ciao.time -text {Lightcurve} -takefocus 0 -command {ds9Cmd "-analysis task TIME"} \
   -image [image create photo -file "$ds9_hack_root/UI/lightcurve.png"]
ttk::button $ds9(hack_top).ciao.glvary -text {GL Vary} -takefocus 0 -command {ds9Cmd "-analysis task {Gregory-Loredo Lightcurve}"} \
   -image [image create photo -file "$ds9_hack_root/UI/glvary.png"]

ttk::button $ds9(hack_top).ciao.stats -text {Statistics} -takefocus 0 -command {ds9Cmd "-analysis task {Statistics (dmstat)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/stats.png"]

ttk::button $ds9(hack_top).ciao.netcts -text {Net Counts} -takefocus 0 -command {ds9Cmd "-analysis task {Net Counts}"} \
   -image [image create photo -file "$ds9_hack_root/UI/net.png"]

ttk::button $ds9(hack_top).ciao.flux -text {Srcflux} -takefocus 0 -command {ds9Cmd "-analysis task {Photometry (srcflux)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/flux.png"]

ttk::button $ds9(hack_top).ciao.coords -text {Cooridnates} -takefocus 0 -command {ds9Cmd "-analysis task {Chandra Coordinates}"} \
   -image [image create photo -file "$ds9_hack_root/UI/coords.png"]

## -- Sherpa

ttk::button $ds9(hack_top).ciao.specfit -text {Spectral Fit} -takefocus 0 -command {ds9Cmd "-analysis task {Spectral Fit}"} \
   -image [image create photo -file "$ds9_hack_root/UI/specfit.png"]

ttk::button $ds9(hack_top).ciao.imgfit -text {2D Fit} -takefocus 0 -command {ds9Cmd "-analysis task {2D Image Fit}"} \
   -image [image create photo -file "$ds9_hack_root/UI/imgfit.png"]



#~ pfold.png
ttk::button $ds9(hack_top).ciao.pfold -text {Period Fold} -takefocus 0 -command {ds9Cmd "-analysis task {Period Fold}"} \
   -image [image create photo -file "$ds9_hack_root/UI/pfold.png"]

#~ pixel_histogram.png
ttk::button $ds9(hack_top).ciao.imghist -text {Pixel Histogram} -takefocus 0 -command {ds9Cmd "-analysis task {Pixel}"} \
   -image [image create photo -file "$ds9_hack_root/UI/pixel_histogram.png"]
#~ radial_prof.png
ttk::button $ds9(hack_top).ciao.rprof -text {Radial Profile} -takefocus 0 -command {ds9Cmd "-analysis task {Radial Profile}"} \
   -image [image create photo -file "$ds9_hack_root/UI/radial_prof.png"]

#~ mexhat.png
ttk::button $ds9(hack_top).ciao.wav -text {Wavdetect} -takefocus 0 -command {ds9Cmd "-analysis task {wavdetect}"} \
   -image [image create photo -file "$ds9_hack_root/UI/mexhat.png"]
#~ cell.png
ttk::button $ds9(hack_top).ciao.cel -text {Celldetect} -takefocus 0 -command {ds9Cmd "-analysis task {celldetect}"} \
   -image [image create photo -file "$ds9_hack_root/UI/cell.png"]
#~ vtp.png
ttk::button $ds9(hack_top).ciao.vtp -text {Vtpdetect} -takefocus 0 -command {ds9Cmd "-analysis task {vtpdetect}"} \
   -image [image create photo -file "$ds9_hack_root/UI/vtp.png"]

ttk::button $ds9(hack_top).ciao.filth -text {Dmfilth} -takefocus 0 -command {ds9Cmd "-analysis task {Source Fill}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmfilth.png"]


ttk::button $ds9(hack_top).ciao.thresh -text {Dmimgthresh} -takefocus 0 -command {ds9Cmd "-analysis task {Threshold}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmimgthresh.png"]
ttk::button $ds9(hack_top).ciao.imgfilt -text {Dmimgfilt} -takefocus 0 -command {ds9Cmd "-analysis task {Non-Linear Filter}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmimgfilt.png"]
ttk::button $ds9(hack_top).ciao.imgadapt -text {Dmimgadapt} -takefocus 0 -command {ds9Cmd "-analysis task {Adaptive Smooth}"} \
   -image [image create photo -file "$ds9_hack_root/UI/adaptive_smooth.png"]
ttk::button $ds9(hack_top).ciao.csmooth -text {Csmooth} -takefocus 0 -command {ds9Cmd "-analysis task {Csmooth}"} \
   -image [image create photo -file "$ds9_hack_root/UI/csmooth.png"]
ttk::button $ds9(hack_top).ciao.nautilus -text {Dmnautilus} -takefocus 0 -command {ds9Cmd "-analysis task {Adaptive Bin}"} \
   -image [image create photo -file "$ds9_hack_root/UI/adaptive_bin.png"]
ttk::button $ds9(hack_top).ciao.lasso -text {Dmimglasso} -takefocus 0 -command {ds9Cmd "-analysis task {Lasso}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmimglasso.png"]
ttk::button $ds9(hack_top).ciao.ellipse -text {Dmellipse} -takefocus 0 -command {ds9Cmd "-analysis task {Ellipse}"} \
   -image [image create photo -file "$ds9_hack_root/UI/dmellipse.png"]

ttk::button $ds9(hack_top).ciao.calc_add -text {Add} -takefocus 0 -command {ds9Cmd "-analysis task {ADD: previous frame to current frame (c+p)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/calc_add.png"]
ttk::button $ds9(hack_top).ciao.calc_sub -text {Sub} -takefocus 0 -command {ds9Cmd "-analysis task {SUB2: subtract current frame from previous (p-c)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/calc_sub.png"]
ttk::button $ds9(hack_top).ciao.calc_mul -text {Mul} -takefocus 0 -command {ds9Cmd "-analysis task {MUL: multiply current and previous frame (c*p)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/calc_mul.png"]
ttk::button $ds9(hack_top).ciao.calc_div -text {Div} -takefocus 0 -command {ds9Cmd "-analysis task {DIV2: divide previous frame by current (p/c)}"} \
   -image [image create photo -file "$ds9_hack_root/UI/calc_div.png"]

ttk::button $ds9(hack_top).ciao.marx -text {MARX} -takefocus 0 -command {ds9Cmd "-analysis task {Simulate PSF with MARX}"} \
   -image [image create photo -file "$ds9_hack_root/UI/groucho.png"]
   

pack $ds9(hack_top).ciao.pi -side left
pack $ds9(hack_top).ciao.time -side left
pack $ds9(hack_top).ciao.glvary -side left
pack $ds9(hack_top).ciao.pfold -side left

pack $ds9(hack_top).ciao.specfit -padx {15 0} -side left
pack $ds9(hack_top).ciao.imgfit  -side left


pack $ds9(hack_top).ciao.stats -padx {15 0} -side left
pack $ds9(hack_top).ciao.netcts  -side left
pack $ds9(hack_top).ciao.flux  -side left
pack $ds9(hack_top).ciao.coords  -side left

pack $ds9(hack_top).ciao.imghist  -padx {15 0} -side left
pack $ds9(hack_top).ciao.rprof  -side left

pack $ds9(hack_top).ciao.wav  -padx {15 0} -side left
pack $ds9(hack_top).ciao.cel  -side left
pack $ds9(hack_top).ciao.vtp  -side left

pack $ds9(hack_top).ciao.filth  -padx {15 0} -side left
pack $ds9(hack_top).ciao.thresh -side left
pack $ds9(hack_top).ciao.imgfilt -side left
pack $ds9(hack_top).ciao.imgadapt -side left
pack $ds9(hack_top).ciao.csmooth -side left
pack $ds9(hack_top).ciao.nautilus -side left

pack $ds9(hack_top).ciao.lasso -side left -padx {15 0}
pack $ds9(hack_top).ciao.ellipse -side left

pack $ds9(hack_top).ciao.marx -side left -padx {15 0}


pack $ds9(hack_top).ciao.calc_add  -padx {15 0} -side left
pack $ds9(hack_top).ciao.calc_sub  -side left
pack $ds9(hack_top).ciao.calc_mul  -side left
pack $ds9(hack_top).ciao.calc_div  -side left


if { ![catch {package require tooltip}] } {
    tooltip::tooltip $ds9(hack_top).ciao.pi "PI Spectrum"
    tooltip::tooltip $ds9(hack_top).ciao.time "Lightcurve "
    tooltip::tooltip $ds9(hack_top).ciao.glvary "Gregory-Loredo lightcurve"
    tooltip::tooltip $ds9(hack_top).ciao.pfold "Period Fold"
    tooltip::tooltip $ds9(hack_top).ciao.specfit  "Spectral Fit"
    tooltip::tooltip $ds9(hack_top).ciao.imgfit  "2D Image Fit"
    tooltip::tooltip $ds9(hack_top).ciao.stats  "Statistics (dmstat)"
    tooltip::tooltip $ds9(hack_top).ciao.netcts  "Net Counts"
    tooltip::tooltip $ds9(hack_top).ciao.flux  "Source Flux"
    tooltip::tooltip $ds9(hack_top).ciao.coords  "Chandra Coordinates"
    tooltip::tooltip $ds9(hack_top).ciao.imghist   "Pixel Histogram"
    tooltip::tooltip $ds9(hack_top).ciao.rprof  "Radial Profile"
    tooltip::tooltip $ds9(hack_top).ciao.wav   "Wavdetect"
    tooltip::tooltip $ds9(hack_top).ciao.cel  "Celldetect"
    tooltip::tooltip $ds9(hack_top).ciao.vtp  "VTP detect"
    tooltip::tooltip $ds9(hack_top).ciao.filth   "Fill in holes (dmfilth)"
    tooltip::tooltip $ds9(hack_top).ciao.thresh "Threshold"
    tooltip::tooltip $ds9(hack_top).ciao.imgfilt "Non-linear filtering (dmimgfilt)"
    tooltip::tooltip $ds9(hack_top).ciao.imgadapt "Adaptive Smooth (dmimgadapt)"
    tooltip::tooltip $ds9(hack_top).ciao.csmooth "Csmooth"
    tooltip::tooltip $ds9(hack_top).ciao.nautilus "Adaptive Binning (dmnautilus)"
    tooltip::tooltip $ds9(hack_top).ciao.lasso "Lasso pixels (dmimglasso)" 
    tooltip::tooltip $ds9(hack_top).ciao.ellipse "ECF Ellipse (dmellipse)"
    tooltip::tooltip $ds9(hack_top).ciao.marx "Run Marx" 
    tooltip::tooltip $ds9(hack_top).ciao.calc_add   "Add current to previous frame"
    tooltip::tooltip $ds9(hack_top).ciao.calc_sub  "Subtract current from previous frame"
    tooltip::tooltip $ds9(hack_top).ciao.calc_mul  "Multiply current and previous frame"
    tooltip::tooltip $ds9(hack_top).ciao.calc_div  "Divide current frame by previous"
}


