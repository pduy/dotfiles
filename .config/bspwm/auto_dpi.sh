#!/bin/bash

# Get the primary screen's resolution
resolution=$(xrandr --query | grep " connected primary" | grep -oP '\d+x\d+')
width=${resolution%x*}
height=${resolution#*x}

echo $width
echo $height

# Determine DPI based on resolution
if [[ $height -ge 2160 ]]; then  # 4K
    dpi=132
    export POLYBAR_HEIGHT=30
elif [[ $height -ge 1504 ]]; then  # laptop
    dpi=132
    export POLYBAR_HEIGHT=30
elif [[ $height -ge 1440 ]]; then  # 2K/QHD
    dpi=114
    export POLYBAR_HEIGHT=22
elif [[ $height -ge 1080 ]]; then  # FHD
    dpi=114
    export POLYBAR_HEIGHT=22
else  # lower
    dpi=114
    export POLYBAR_HEIGHT=22
fi

# Update polybar
sed -i -E "s/height = [0-9]+/height = $POLYBAR_HEIGHT/g" ~/.config/polybar/config

# Adjust WM top padding
bspc config top_padding $(($POLYBAR_HEIGHT + 2))

# Update ~/.Xresources
sed -i "/Xft.dpi:/c\Xft.dpi: $dpi" ~/.Xdefaults

# Merge changes (for X applications)
xrdb -merge ~/.Xdefaults

