

set atcol 0

ttk::frame $ds9(main).hack
#grid configure $ds9(main).hack -row 3 -column $atcol -columnspan 3 -sticky we

source $ds9_hack_root/custom_layout.tcl
ds9Cmd "-view vertical"

grid configure $ds9(main).hack -row -0 -column 0 -columnspan 5 -sticky we


ttk::frame $ds9(main).hack.quick
pack $ds9(main).hack.quick -anchor w -fill x
incr atcol

## ------------------------


source $ds9_hack_root/edit_menu.tcl



source $ds9_hack_root/region_shapes.tcl
source $ds9_hack_root/region_color.tcl
source $ds9_hack_root/region_width.tcl
source $ds9_hack_root/region_dash.tcl
source $ds9_hack_root/region_state.tcl
source $ds9_hack_root/region_layer.tcl
source $ds9_hack_root/image_scale.tcl
source $ds9_hack_root/image_processing.tcl

ttk::button $ds9(main).hack.quick.quit -text {Quit} -takefocus 0 -command {ds9Cmd "-exit"} \
    -image [image create photo -file "$ds9_hack_root/UI/quit.png"]
pack $ds9(main).hack.quick.quit -side right -padx 10

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
