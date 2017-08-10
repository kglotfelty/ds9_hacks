$ds9(mb).color add cascade -label "XImage" \
  -menu $ds9(mb).color.ximage

menu $ds9(mb).color.ximage -tearoff 1

set cmaps [ list "blue2" "blue3" "blue4" "bluebase1" "bluebase3" "bluyel" \
    "brown" "green1" "green5" "green7" "green8" "green9" "invspec" "pink1" \
    "pink2" "pink3" "pink4" "pinkbase1" "pinkbase3" "pinkbase4" "pinkbase5" \
    "purby" "purple1" "purple2" "purple3" "purple4" "puryb" "red2" "redbase4" \
    "vt1" "vt2" "vt3" "vt4" "vt5" "vt6" "vt7" "yellow1" ] 

foreach c  $cmaps  {
    MyLoadColormapFile $ds9(mb).color.ximage "$ds9_hack_root/LUT/XImage" $c ".lut"
}

