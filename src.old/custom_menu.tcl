



source $ds9_hack_root/custom_layout.tcl
ds9Cmd "-view vertical"


if { [info exists env(ASCDS_INSTALL)] } {
    source $ds9_hack_root/ciao_commands.tcl
}
