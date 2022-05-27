
global lutbar_icons
global lutbar_names
global unknown_icon
set lutbar_icons {}
set lutbar_names {}


set lutbar [list "$ds9_hack_root/LUT/DS9/grey.png" \
                 "$ds9_hack_root/LUT/DS9/bb.png" \
                 "$ds9_hack_root/LUT/ImageJ/smart.png" \
                 "$ds9_hack_root/LUT/ImageJ/heart.png" \
                 "$ds9_hack_root/LUT/XImage/purple3.png" \
                 "$ds9_hack_root/LUT/Neota/neota_sunset-in-atlantis.png" \
                 "$ds9_hack_root/LUT/ImageJ/005-random.png" \
                 "$ds9_hack_root/LUT/ImageJ/16_ramps.png" \
                 "$ds9_hack_root/LUT/ImageJ/blue_orange.png" \
                 "$ds9_hack_root/LUT/ImageJ/icool.png" \
                 "$ds9_hack_root/LUT/XImage/green7.png" \
                 "$ds9_hack_root/LUT/Neota/neota_pastel-rainbow.png" \
                 "$ds9_hack_root/LUT/Neota/neota_rainbow-sunset.png" \
                 "$ds9_hack_root/LUT/Neota/neota_purple-gold.png" \
                 "$ds9_hack_root/LUT/Neota/neota_pink-sunset.png" \
                  ]                 

set unknown_lut "$ds9_hack_root/LUT/unknown.png"


proc my_change_lut {newval change} {
  global lutbar_icons
  global lutbar_names
  global ds9
  global colorbar
  global unknown_icon

  if { $newval >= 0 } {

      if {$change} {
        ds9Cmd "-cmap [lindex $lutbar_names $newval]"
      }
      $ds9(main).hack_top.lut.at configure \
      -text $newval \
      -image [lindex $lutbar_icons $newval]
  } else {
      $ds9(main).hack_top.lut.at configure \
      -text $newval \
      -image [lindex $unknown_icon 0]
      
      
  }
}

global colorbar

trace add variable colorbar(map) write "sync_colormap"

proc sync_colormap {name1 name2 op} {
  global colorbar
  global lutbar_names

  set idx [lsearch $lutbar_names $colorbar(map)]
  my_change_lut $idx 0

}


foreach {i} $lutbar {

    if { [file exists $i] == 1 } {

        set oi [image create photo boo -file $i]

        image create photo moo$i -width 200 -height 16
        set goo [moo$i copy boo -zoom 2]
        lappend lutbar_icons moo$i

        set f [split $i "/"]
        set g [lindex $f end]
        set gg [split $g .]
        lappend lutbar_names [lindex $gg 0]
    }
    
}

set oi [image create photo boo -file $unknown_lut]
image create photo moo999 -width 200 -height 16
set boo99 [moo999 copy boo -zoom 2]
lappend unknown_icon moo999



ttk::frame $ds9(main).hack_top.lut 
pack $ds9(main).hack_top.lut -side left -padx 5

ttk::menubutton $ds9(main).hack_top.lut.at -menu $ds9(main).hack_top.lut.at.m \
  -text "Lookup Tables" \
  -image [lindex $lutbar_icons 0] -takefocus 0
  

menu $ds9(main).hack_top.lut.at.m -tearoff 0


for {set i 0} {$i < [llength $lutbar_icons]} {incr i} {
    $ds9(main).hack_top.lut.at.m add command -label $i \
        -command "my_change_lut $i 1" \
        -image [lindex $lutbar_icons $i]
}


pack $ds9(main).hack_top.lut.at -side left


ttk::button $ds9(main).hack_top.lut.invert -text {Invert} -takefocus 0\
  -command toggle_colorbar_invert \
  -image [image create photo -file "$ds9_hack_root/UI/colorbar_reverse.png"] 

pack $ds9(main).hack_top.lut.invert -side left


if { ![catch {package require tooltip}]} {
    tooltip::tooltip $ds9(main).hack_top.lut.at "Colormaps"
    tooltip::tooltip $ds9(main).hack_top.lut.invert "Reverse Colormap"    
}


proc toggle_colorbar_invert {} {
  global colorbar
  
  if { $colorbar(invert) } {
      set colorbar(invert) 0
  } else {
      set colorbar(invert) 1
  }
  
  InvertColorbar
    
    
}

