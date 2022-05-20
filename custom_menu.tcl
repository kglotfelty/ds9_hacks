



source $ds9_hack_root/custom_layout.tcl
ds9Cmd "-view vertical"

ttk::frame $ds9(main).hack_top
grid configure $ds9(main).hack_top -row -0 -column 0 -columnspan 4 -sticky we

ttk::frame $ds9(main).hack_left
grid configure $ds9(main).hack_left -row 1 -column 0 -sticky ns

ttk::frame $ds9(main).hack_bottom
grid configure $ds9(main).hack_bottom -row 2 -column 1 -columnspan 3 -sticky we


## ------------------------

## Left hand side

source $ds9_hack_root/edit_menu.tcl
source $ds9_hack_root/region_shapes.tcl
source $ds9_hack_root/region_color.tcl
source $ds9_hack_root/region_width.tcl
source $ds9_hack_root/region_dash.tcl
source $ds9_hack_root/region_state.tcl
source $ds9_hack_root/region_layer.tcl


## Top

source $ds9_hack_root/lut.tcl
source $ds9_hack_root/image_scale.tcl
source $ds9_hack_root/image_processing.tcl

ttk::button $ds9(main).hack_top.quit -text {Quit} -takefocus 0 -command {ds9Cmd "-exit"} \
   -image [image create photo -file "$ds9_hack_root/UI/quit.png"]
pack $ds9(main).hack_top.quit -side right -padx 10


#~ ## ------------------------

## Bottom 

source $ds9_hack_root/bin_buttons.tcl
source $ds9_hack_root/block_buttons.tcl
source $ds9_hack_root/zoom_buttons.tcl
source $ds9_hack_root/frame_buttons.tcl


#~ ## ----------------------------------------

if { [info exists env(ASCDS_INSTALL)] } {
    source $ds9_hack_root/ciao_commands.tcl
}
