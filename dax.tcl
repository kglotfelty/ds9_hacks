

global env

if { [info exists env(ASCDS_INSTALL) ] } {
  if { [file exists  $env(ASCDS_INSTALL)/contrib/config/ciao.ds9] == 1 } {
    ds9Cmd "-analysis $env(ASCDS_INSTALL)/contrib/config/ciao.ds9"

    if { [file exists  $env(ASCDS_INSTALL)/contrib/config/chips_startup.tk] == 1 } {
      source $env(ASCDS_INSTALL)/contrib/config/chips_startup.tk
    }
  }
}
