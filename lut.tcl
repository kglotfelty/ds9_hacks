
set ds9_hack_root "/home/kjg/ds9_hacks"

global lutbar_icons
global lutbar_names
set lutbar_icons {}
set lutbar_names {}


set lutbar [list "$ds9_hack_root/LUT/DS9/grey.png" \
                 "$ds9_hack_root/LUT/DS9/bb.png" \
                 "$ds9_hack_root/LUT/ImageJ/smart.png" \
                 "$ds9_hack_root/LUT/ImageJ/heart.png" \
                 "$ds9_hack_root/LUT/XImage/purple3.png" \
                 "$ds9_hack_root/LUT/Neota/neota_sunset-in-atlantis.png" \
                 "$ds9_hack_root/LUT/ImageJ/005-randompng" \
                 "$ds9_hack_root/LUT/ImageJ/16_ramps.png" \
                 "$ds9_hack_root/LUT/ImageJ/blue_orange.png" \
                 "$ds9_hack_root/LUT/ImageJ/icool.png" \
                 "$ds9_hack_root/LUT/XImage/green7.png" \
                 "$ds9_hack_root/LUT/Neota/neota_pastel-rainbow.png" \
                 "$ds9_hack_root/LUT/Neota/neota_rainbow-sunset.png" \
                 "$ds9_hack_root/LUT/Neota/neota_purple-gold.png" \
                 "$ds9_hack_root/LUT/Neota/neota_pink-sunset.png" \
                  ]                 


proc my_change_lut {newval} {
  global lutbar_icons
  global lutbar_names
  global ds9

  ds9Cmd "-cmap [lindex $lutbar_names $newval]"
  
  $ds9(main).hack.quick_two.lut.at configure \
  -text $newval \
  -image [lindex $lutbar_icons $newval]
     
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



ttk::frame $ds9(main).hack.quick_two.lut 
grid $ds9(main).hack.quick_two.lut -row 0 -column $atcol
incr atcol

ttk::menubutton $ds9(main).hack.quick_two.lut.at -menu $ds9(main).hack.quick_two.lut.at.m \
  -text "Lookup Tables" \
  -image [lindex $lutbar_icons 0] -takefocus 0
  
  
  
menu $ds9(main).hack.quick_two.lut.at.m -tearoff 0


for {set i 0} {$i < [llength $lutbar_icons]} {incr i} {

$ds9(main).hack.quick_two.lut.at.m add command -label $i \
    -command "my_change_lut $i" \
    -image [lindex $lutbar_icons $i]


}

grid $ds9(main).hack.quick_two.lut.at -row 0 -column 0



