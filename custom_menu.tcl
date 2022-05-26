



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
### source $ds9_hack_root/region_dash.tcl  # This is too fragile
source $ds9_hack_root/region_state.tcl
source $ds9_hack_root/region_layer.tcl


## Top

ttk::button $ds9(main).hack_top.file_open -text "File Open" \
  -takefocus 0 -command [list OpenDialog fits] \
  -image [image create photo -file "$ds9_hack_root/UI/file_open.png"]

ttk::button $ds9(main).hack_top.save_eps -text "Save As EPS" \
  -takefocus 0 -command [list SaveImageDialog eps] \
  -image [image create photo -file "$ds9_hack_root/UI/save_as_eps.png"]

ttk::button $ds9(main).hack_top.save_png -text "Save As PNG" \
  -takefocus 0 -command [list SaveImageDialog png] \
  -image [image create photo -file "$ds9_hack_root/UI/save_as_png.png"]

ttk::button $ds9(main).hack_top.print -text "Print" \
  -takefocus 0 -command PSPrint \
  -image [image create photo -file "$ds9_hack_root/UI/print.png"]

ttk::button $ds9(main).hack_top.backup -text "Backup" \
  -takefocus 0 -command BackupDialog \
  -image [image create photo -file "$ds9_hack_root/UI/backup.png"]

ttk::button $ds9(main).hack_top.prism -text "Prism" \
  -takefocus 0 -command [list PrismDialogLoad prism] \
  -image [image create photo -file "$ds9_hack_root/UI/prism.png"]

ttk::button $ds9(main).hack_top.notes -text "Notes" \
  -takefocus 0 -command DisplayNotes \
  -image [image create photo -file "$ds9_hack_root/UI/notes.png"]


pack $ds9(main).hack_top.file_open -side left -padx {5 0}
pack $ds9(main).hack_top.save_eps -side left 
pack $ds9(main).hack_top.save_png -side left 
pack $ds9(main).hack_top.print -side left 
pack $ds9(main).hack_top.backup -side left 
pack $ds9(main).hack_top.prism -side left -padx {5 0}
pack $ds9(main).hack_top.notes -side left -padx {0 5}


source $ds9_hack_root/lut.tcl
source $ds9_hack_root/image_scale.tcl
source $ds9_hack_root/image_processing.tcl

ttk::button $ds9(main).hack_top.quit -text {Quit} -takefocus 0 -command {ds9Cmd "-exit"} \
   -image [image create photo -file "$ds9_hack_root/UI/quit.png"]
pack $ds9(main).hack_top.quit -side right -padx 5


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
