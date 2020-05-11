

proc my_change_width { plusminus } {
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


ttk::frame $ds9(main).quick.size 
grid $ds9(main).quick.size -row 0 -column $atcol -padx 5

incr atcol
ttk::entry $ds9(main).quick.size.at -textvariable marker(width) -state readonly -width 3 -takefocus 0
ttk::button $ds9(main).quick.size.plus -text {+} -takefocus 0 -command {my_change_width 1} \
    -image [image create photo -file "$ds9_hack_root/UI/plus.png"]
ttk::button $ds9(main).quick.size.mins -text {-} -takefocus 0 -command {my_change_width -1} \
    -image [image create photo -file "$ds9_hack_root/UI/minus.png"]

grid $ds9(main).quick.size.plus -row 0 -column 2
grid $ds9(main).quick.size.at -row 0 -column 1
grid $ds9(main).quick.size.mins -row 0 -column 0

