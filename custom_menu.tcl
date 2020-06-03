

set atcol 0

ttk::frame $ds9(main).hack
grid configure $ds9(main).hack -row 3 -column $atcol -columnspan 3 -sticky we

ttk::frame $ds9(main).hack.quick
pack $ds9(main).hack.quick -anchor w
incr atcol

# ----------------------------------------

source $ds9_hack_root/region_shapes.tcl
# ----------------------------------------

source $ds9_hack_root/region_width.tcl
# ----------------------------------------

source $ds9_hack_root/region_dash.tcl
# ----------------------------------------

source $ds9_hack_root/region_state.tcl
# ----------------------------------------

source $ds9_hack_root/region_layer.tcl
# ----------------------------------------

source $ds9_hack_root/region_color.tcl
# ----------------------------------------


source $ds9_hack_root/image_scale.tcl
# ----------------------------------------

source $ds9_hack_root/image_processing.tcl

## ------------------------

set atcol 0

ttk::frame $ds9(main).hack.quick_two 
pack $ds9(main).hack.quick_two -side top -anchor w -pady 2
incr atcol

source $ds9_hack_root/lut.tcl
source $ds9_hack_root/bin_buttons.tcl
source $ds9_hack_root/block_buttons.tcl
source $ds9_hack_root/zoom_buttons.tcl
source $ds9_hack_root/frame_buttons.tcl


## ----------------------------------------

set atcol 0

ttk::frame $ds9(main).hack.quick_three 
pack $ds9(main).hack.quick_three -side top -anchor w -pady 2
incr atcol

if { [info exists env(ASCDS_INSTALL)] } {
    source $ds9_hack_root/ciao_commands.tcl
}
