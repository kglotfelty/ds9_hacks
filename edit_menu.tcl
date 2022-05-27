
global edit_icons
set edit_icons [list [image create photo -file "$ds9_hack_root/UI/edit_none.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_region.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_crosshair.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_colorbar.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_pan.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_zoom.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_rotate.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_crop.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_catalog.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_footprint.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_3d.png" ] \
                     [image create photo -file "$ds9_hack_root/UI/edit_examine.png" ] \
                   ]


proc my_change_edit { newval cmd } {
  global marker
  global ds9
  global edit_icons
 
  ds9Cmd "-mode $cmd"

  $ds9(main).hack_left.edit_menu.at configure -text $newval \
  -image [lindex $edit_icons $newval]


}

ttk::frame $ds9(main).hack_left.edit_menu 
pack $ds9(main).hack_left.edit_menu -side top

ttk::menubutton $ds9(main).hack_left.edit_menu.at -menu $ds9(main).hack_left.edit_menu.at.m \
  -text "Edit Mode"  -direction right \
  -image [lindex $edit_icons 1] -takefocus 0

if { ![catch {package present tooltip}] } {
    tooltip::tooltip $ds9(main).hack_left.edit_menu.at "Edit Mode"
}


#~ ds9Cmd "-mode region"  

menu $ds9(main).hack_left.edit_menu.at.m -tearoff 0

$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {None}] -command "my_change_edit 0 none" \
    -image [lindex $edit_icons 0] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Region}] -command "my_change_edit 1 region" \
    -image [lindex $edit_icons 1] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Crosshair}] -command "my_change_edit 2 crosshair" \
    -image [lindex $edit_icons 2] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Colorbar}] -command "my_change_edit 3 colorbar" \
    -image [lindex $edit_icons 3] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Pan}] -command "my_change_edit 4 pan" \
    -image [lindex $edit_icons 4] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Zoom}] -command "my_change_edit 5 zoom" \
    -image [lindex $edit_icons 5] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Rotate}] -command "my_change_edit 6 rotate" \
    -image [lindex $edit_icons 6] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Crop}] -command "my_change_edit 7 crop" \
    -image [lindex $edit_icons 7] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Catalog}] -command "my_change_edit 8 catalog" \
    -image [lindex $edit_icons 8] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Footprint}] -command "my_change_edit 9 footprint" \
    -image [lindex $edit_icons 9] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {3D}] -command "my_change_edit 10 3d" \
    -image [lindex $edit_icons 10] -compound left
$ds9(main).hack_left.edit_menu.at.m add command -label [msgcat::mc {Examine}] -command "my_change_edit 11 examine" \
    -image [lindex $edit_icons 11] -compound left



grid $ds9(main).hack_left.edit_menu.at -row 0 -column 0

global current
trace add variable current(mode) write "sync_edit_mode"

proc sync_edit_mode {name1 name2 op} {
    global current

    switch $current(mode) {
        none      {my_change_edit 0 $current(mode)}
        region    {my_change_edit 1 $current(mode)}
        crosshair {my_change_edit 2 $current(mode)}
        colorbar  {my_change_edit 3 $current(mode)}
        pan       {my_change_edit 4 $current(mode)}  
        zoom      {my_change_edit 5 $current(mode)}
        rotate    {my_change_edit 6 $current(mode)}
        crop      {my_change_edit 7 $current(mode)}
        catalog   {my_change_edit 8 $current(mode)}
        footprint {my_change_edit 9 $current(mode)}
        examine   {my_change_edit 10 $current(mode)}
        3d        {my_change_edit 11 $current(mode)}
    }


}


