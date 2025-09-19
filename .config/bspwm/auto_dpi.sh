#!/bin/bash

# Get the primary screen's resolution
resolution=$(xrandr --query | grep " connected primary" | grep -oP '\d+x\d+')
width=${resolution%x*}
height=${resolution#*x}

# Determine DPI based on resolution
if [[ $width -ge 3840 ]]; then  # 4K
    dpi=144
elif [[ $width -ge 2560 ]]; then  # 2K/QHD
    dpi=110
elif [[ $width -ge 1080 ]]; then  # FHD
    dpi=110
else  # lower
    dpi=96
fi

# Update ~/.Xresources
sed -i "/Xft.dpi:/c\Xft.dpi: $dpi" ~/.Xdefaults

# Merge changes (for X applications)
xrdb -merge ~/.Xdefaults
