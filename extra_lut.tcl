



proc MyLoadColormapFile { myid dir filename extn} {
    global colorbar

    if {$filename != {}} {
        set lfile "$dir/$filename$extn"
        set png ".png"
        set pfile "$dir/$filename$png"
        colorbar load "\{$lfile\}"
        set id [colorbar get id]
        set colorbar(map) [colorbar get name]
        set max_kjg_color $id
        $myid add radiobutton \
            -label "$colorbar(map)" \
            -variable colorbar(map) -command "ChangeColormapID $id"  \
            -image [image create photo -file "$pfile" ]
    }
}


$ds9(mb).color add separator


foreach c [list "ximage" "imagej" "neota" "kst" "ncar" "mpl" "cet" "cmocean"] {
    set lut $ds9_hack_root/LUT/$c.tcl
    puts $lut
    if { [file exists $lut] == 1 } {
        source $lut
    }

}

