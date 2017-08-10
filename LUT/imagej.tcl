$ds9(mb).color add cascade -label "ImageJ" \
  -menu $ds9(mb).color.imagej
menu $ds9(mb).color.imagej -tearoff 1

set cmaps [list "003-ice" "004-phase" "005-random" "16_ramps" "5_ramps" \
    "6_shades" "amber" "auxctq" "blue_orange" "blue_orange_icb" "brain" \
    "cequal" "cold" "icool" "edges" "gem-256" "gold" "gyr_centre" "heart" \
    "hue" "hue_ramps_08" "hue_ramps_16" "iman" "mixed" "pastel" "royal" \
    "sepia" "smart" "split_blackblue_redwhite" "split_blackwhite_ge" \
    "split_blackwhite_warmmetal" "split_bluered_warmmetal" "system_lut" \
    "thal_256" "thallium" "topography" "unionjack" "vivid"]


foreach c  $cmaps  {
    MyLoadColormapFile $ds9(mb).color.imagej "$ds9_hack_root/LUT/ImageJ" $c ".lut"
}


