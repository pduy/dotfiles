#!/bin/bash
export DISPLAY=:0
export XAUTHORITY=/home/duy/.Xauthority
export BSPWM_SOCKET=/tmp/bspwm_0_0-socket

connected_dp=$(xrandr | grep -E "^DisplayPort-[0-9]+ connected" | head -1 | awk '{print $1}')

# If a connected DisplayPort was found, set it as primary
if [ -n "$connected_dp" ]; then
    echo "Setting $connected_dp as primary display"
    xrandr --output "$connected_dp" --primary
fi

xrandr --auto
#&& sleep 0.5 && /usr/bin/bspc wm -r
