proc my_change_marker { iswhat } {

  global ds9
  global marker

  set marker(shape) $iswhat

}


proc my_change_width { plusminus } {
  global ds9
  global marker

    if { $plusminus == 1 } {
	if { $marker(width) <= 3 } {
	    incr marker(width)
	}
    }

    if { $plusminus == -1 } {
	if { $marker(width) >= 2 } {
	    incr marker(width) -1
	}
    }

    MarkerWidth


}


proc my_change_srcbkg {} {
  global ds9
  global marker

    if { $marker(source) == 0 } {
	set marker(source) 1
    } else {
	set marker(source) 0
    }

    MarkerProp source

}


proc my_change_incexl {} {
  global ds9
  global marker

    if { $marker(include) == 0 } {
	set marker(include) 1
    } else {
	set marker(include) 0
    }

    MarkerProp include

}


proc my_change_color {color} {
  global marker

  set marker(color) $color
  MarkerColor 

}


ds9Cmd "-analysis $ds9_hack_root/dashes.ans"


set atcol 0

frame $ds9(main).quick
grid configure $ds9(main).quick -row 3 -column $atcol -columnspan 3 -sticky we
incr atcol

# ------------------------------------------------------------


frame $ds9(main).quick.shapes
grid $ds9(main).quick.shapes -row 0 -column $atcol -columnspan 1 -padx 5
incr atcol

button $ds9(main).quick.shapes.circle -text {C} -takefocus 0 -command {my_change_marker circle} \
    -image [image create photo -file "$ds9_hack_root/UI/circle.png"] 
button $ds9(main).quick.shapes.annulus -text {A} -takefocus 0 -command {my_change_marker annulus} \
    -image [image create photo -file "$ds9_hack_root/UI/annulus.png"]
button $ds9(main).quick.shapes.ellipse -text {E} -takefocus 0 -command {my_change_marker ellipse} \
    -image [image create photo -file "$ds9_hack_root/UI/ellipse.png"]
button $ds9(main).quick.shapes.box -text {B} -takefocus 0 -command {my_change_marker box} \
    -image [image create photo -file "$ds9_hack_root/UI/box.png"]
button $ds9(main).quick.shapes.poly -text {P} -takefocus 0 -command {my_change_marker polygon} \
    -image [image create photo -file "$ds9_hack_root/UI/poly.png"]
button $ds9(main).quick.shapes.text -text {T} -takefocus 0 -command {my_change_marker text} \
    -image [image create photo -file "$ds9_hack_root/UI/text.png"]


grid $ds9(main).quick.shapes.circle -row 0 -column 0
grid $ds9(main).quick.shapes.annulus -row 0 -column 1
grid $ds9(main).quick.shapes.ellipse -row 0 -column 2
grid $ds9(main).quick.shapes.box -row 0 -column 3
grid $ds9(main).quick.shapes.poly -row 0 -column 4
grid $ds9(main).quick.shapes.text -row 0 -column 5


# ----------------------------------------------------------

frame $ds9(main).quick.size 
grid $ds9(main).quick.size -row 0 -column $atcol -padx 5

incr atcol
entry $ds9(main).quick.size.at -textvariable marker(width) -state readonly -width 3 -takefocus 0
button $ds9(main).quick.size.plus -text {+} -takefocus 0 -command {my_change_width 1} \
    -image [image create photo -file "$ds9_hack_root/UI/plus.png"]
button $ds9(main).quick.size.mins -text {-} -takefocus 0 -command {my_change_width -1} \
    -image [image create photo -file "$ds9_hack_root/UI/minus.png"]

grid $ds9(main).quick.size.plus -row 0 -column 2
grid $ds9(main).quick.size.at -row 0 -column 1
grid $ds9(main).quick.size.mins -row 0 -column 0

# ----------------------------------------

frame $ds9(main).quick.state
grid $ds9(main).quick.state -row 0 -column $atcol -padx 5
incr atcol

button $ds9(main).quick.state.src -text {S/B} -takefocus 0 -command {my_change_srcbkg} \
    -image [image create photo -file "$ds9_hack_root/UI/srcbkg.png"]
button $ds9(main).quick.state.inc -text {I/E} -takefocus 0 -command {my_change_incexl} \
    -image [image create photo -file "$ds9_hack_root/UI/incexl.png"]
grid $ds9(main).quick.state.src -row 0 -column 0
grid $ds9(main).quick.state.inc -row 0 -column 1


# ----------------------------------------

frame $ds9(main).quick.layer
grid $ds9(main).quick.layer -row 0 -column $atcol -columnspan 1 -padx 5
incr atcol
button $ds9(main).quick.layer.back -text {Back} -takefocus 0 -command {MarkerBack } \
    -image [image create photo -file "$ds9_hack_root/UI/back.png"]
button $ds9(main).quick.layer.front -text {Front} -takefocus 0 -command {MarkerFront} \
    -image [image create photo -file "$ds9_hack_root/UI/front.png"]

grid $ds9(main).quick.layer.back -row 0 -column 0
grid $ds9(main).quick.layer.front -row 0 -column 1


# ----------------------------------------


frame $ds9(main).quick.colors
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


# ----------------------------------------

frame $ds9(main).quick.dashes
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


# ----------------------------------------



frame $ds9(main).quick.match
grid $ds9(main).quick.match -row 0 -column $atcol -padx 5
incr atcol
button  $ds9(main).quick.match.wcs -text {WCS} -takefocus 0 -command {ds9Cmd "-match frames wcs" } \
   -image [image create photo -file "$ds9_hack_root/UI/match.png"]
grid  $ds9(main).quick.match.wcs  -row 0 -column 0


# ----------------------------------------

frame $ds9(main).quick.scale
grid $ds9(main).quick.scale -row 0 -column $atcol -padx 5
incr atcol
button $ds9(main).quick.scale.log -text {ln} -takefocus 0 -command {ds9Cmd "-scale log"} \
   -image [image create photo -file "$ds9_hack_root/UI/log.png"]
button $ds9(main).quick.scale.lin -text {lin} -takefocus 0 -command {ds9Cmd "-scale linear"} \
   -image [image create photo -file "$ds9_hack_root/UI/lin.png"]
button $ds9(main).quick.scale.pow -text {pow} -takefocus 0 -command {ds9Cmd "-scale pow" } \
   -image [image create photo -file "$ds9_hack_root/UI/pow.png"]
grid $ds9(main).quick.scale.log -row 0 -column 0 
grid $ds9(main).quick.scale.lin -row 0 -column 1 
grid $ds9(main).quick.scale.pow -row 0 -column 2 


# ----------------------------------------

frame $ds9(main).quick.imgstuff
grid $ds9(main).quick.imgstuff -row 0 -column $atcol -padx 5
incr atcol
button $ds9(main).quick.imgstuff.smth -text {S} -takefocus 0 -command {ds9Cmd "-smooth"} \
   -image [image create photo -file "$ds9_hack_root/UI/smooth.png"]
button $ds9(main).quick.imgstuff.cntr -text {C} -takefocus 0 -command {ds9Cmd "-contour"} \
   -image [image create photo -file "$ds9_hack_root/UI/contour.png"]
grid $ds9(main).quick.imgstuff.smth -row 0 -column 0 
grid $ds9(main).quick.imgstuff.cntr -row 0 -column 1 


## ----------------------------------------

#frame $ds9(main).quick.ciao
#grid $ds9(main).quick.ciao -row 0 -column $atcol -padx 5
#incr atcol
#button $ds9(main).quick.ciao.pi -text {P} -takefocus 0 -command {ds9Cmd "-analysis task PI"} \
   #-image [image create photo -file "$ds9_hack_root/UI/spectrum.png"]
#button $ds9(main).quick.ciao.time -text {T} -takefocus 0 -command {ds9Cmd "-analysis task TIME"} \
   #-image [image create photo -file "$ds9_hack_root/UI/lightcurve.png"]
#button $ds9(main).quick.ciao.glvary -text {G} -takefocus 0 -command {ds9Cmd "-analysis task {G-L Vary}"} \
   #-image [image create photo -file "$ds9_hack_root/UI/glvary.png"]

#button $ds9(main).quick.ciao.coords -text {E} -takefocus 0 -command {ds9Cmd "-analysis task {dmstat (no centroid)}"} \
   #-image [image create photo -file "$ds9_hack_root/UI/stats.png"]

#button $ds9(main).quick.ciao.stats -text {C} -takefocus 0 -command {ds9Cmd "-analysis task {All}"} \
   #-image [image create photo -file "$ds9_hack_root/UI/coords.png"]

#grid $ds9(main).quick.ciao.pi -row 0 -column 0
#grid $ds9(main).quick.ciao.time -row 0 -column 1
#grid $ds9(main).quick.ciao.glvary -row 0 -column 2
#grid $ds9(main).quick.ciao.coords -row 0 -column 3
#grid $ds9(main).quick.ciao.stats -row 0 -column 4


