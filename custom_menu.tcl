

set atcol 0

ttk::frame $ds9(main).quick
grid configure $ds9(main).quick -row 3 -column $atcol -columnspan 3 -sticky we
incr atcol

# ----------------------------------------

source $ds9_hack_root/region_shapes.tcl
# ----------------------------------------

source $ds9_hack_root/region_width.tcl
# ----------------------------------------

source $ds9_hack_root/region_state.tcl
# ----------------------------------------

source $ds9_hack_root/region_layer.tcl
# ----------------------------------------

source $ds9_hack_root/region_color.tcl
# ----------------------------------------

#source $ds9_hack_root/region_dash.tcl
# ----------------------------------------

source $ds9_hack_root/image_scale.tcl
# ----------------------------------------

source $ds9_hack_root/image_processing.tcl
## ----------------------------------------

#~ if { [info exists env(ASCDS_INSTALL)] } {
    #~ source $ds9_hack_root/ciao_commands.tcl
#~ }

