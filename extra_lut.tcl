

proc MyLoadColormapFile { myid dir filename extn} {
    global colorbar
    global icolorbar

    if {$filename == {}} {
        return
    }

    set lfile "$dir/$filename$extn"
    set png ".png"
    set pfile "$dir/$filename$png"

    set fn $lfile

    global colorbar
    global icolorbar
    global current
    global ds9

    if {$fn == {}} {
        return
    }

    # first load into default cmap
    set orgName [colorbar get name]
    set orgInvert [colorbar get invert]

    if {[catch {colorbar load "\{$fn\}"} rr]} {
        Error $rr
        return
    }
    set cmap [colorbar get name]
    lappend icolorbar(user,cmaps) $cmap

    colorbar map $orgName
    colorbar invert $orgInvert

    # now load into all current cmaps
    foreach ff $ds9(frames) {
        set cb ${ff}cb
        switch [$cb get type] {
            base {
                set orgName [$cb get name]
                set orgInvert [$cb get invert]
                if {[catch {$cb load "\{$fn\}"} rr]} {
                    Error $rr
                    return
                }
                $cb map $orgName
                $cb invert $orgInvert
            }
            rgb {}
        }
    }

    # add to menu
    $myid add radiobutton \
        -label $cmap \
        -variable colorbar(map) \
        -command [list ChangeColormapName $cmap] \
        -image [image create photo -file "$pfile" ]

}

proc load_extra_colormaps {} {
    global ds9
    global ds9_hack_root

    $ds9(mb).color add separator

    # Not all these are available on my github repro
    foreach c [list "ximage" "imagej" "neota" "kst" "ncar" "mpl" "cet" "cmocean"] {
        set lut $ds9_hack_root/LUT/$c.tcl
        if { [file exists $lut] == 1 } {
            source $lut
        }

    }

}
