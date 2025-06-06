#! /bin/bash

if [ $# -eq 1 ]
then
    bspc monitor $1 -d 1 2 3 4 5 6 7 8 9 10
elif [ $# -eq 2 ]
then
    bspc monitor $1 -d 1 2 3 4 7 8 9 10
    bspc monitor $2 -d 5 6
elif [ $# -eq 3 ]
then
    bspc monitor $1 -d 1 2 3 8 9 10
    bspc monitor $2 -d 6 7
    bspc monitor $3 -d 4 5
else
    x=$(xrandr | sed -e "s/eDP-1//g")


    main_monitor=""
    sub_monitor=""
    remaining_monitor=""

    if [[ $x == *"HDMI-1 connected"* ]]; then
	main_monitor="HDMI-1"
	sed -i -E "s/Xft.dpi: [0-9]+/Xft.dpi: 96/g" ~/.Xdefaults && xrdb ~/.Xdefaults
    elif [[ $x == *"DP-1 connected"* ]]; then
	main_monitor="DP-1"
	sed -i -E "s/Xft.dpi: [0-9]+/Xft.dpi: 96/g" ~/.Xdefaults && xrdb ~/.Xdefaults
    elif [[ $x == *"DP-3 connected"* ]]; then
	main_monitor="DP-3"
	sed -i -E "s/Xft.dpi: [0-9]+/Xft.dpi: 96/g" ~/.Xdefaults && xrdb ~/.Xdefaults
    elif [[ $x == *"DP-3-1 connected"* ]]; then
	main_monitor="DP-3-1"
	sed -i -E "s/Xft.dpi: [0-9]+/Xft.dpi: 110/g" ~/.Xdefaults && xrdb ~/.Xdefaults
    else
	main_monitor="eDP-1"
	sed -i -E "s/Xft.dpi: [0-9]+/Xft.dpi: 110/g" ~/.Xdefaults && xrdb ~/.Xdefaults
    fi

    x=$(echo $x | sed -e "s/[^e]$main_monitor\s*//")

    if [[ $x == *"DP-3 connected"* ]]; then
	sub_monitor="DP-3"
    elif [[ $x == *"DP-1 connected"* ]]; then
	sub_monitor="DP-1"
    elif [[ $x == *"HDMI-1 connected"* ]]; then
	sub_monitor="HDMI-1"
    elif [[ $main_monitor != "eDP-1" ]]; then
	sub_monitor="eDP-1"
    fi

    if [[ $main_monitor != "eDP-1" && $sub_monitor != "eDP-1" ]]; then
	remaining_monitor="eDP-1"
    fi

    echo $main_monitor
    echo $sub_monitor
    echo $remaining_monitor

    if [[ $sub_monitor != "" ]]; then
	if [[ $remaining_monitor != "" ]]; then
	    xrandr --output $main_monitor --left-of $sub_monitor
	    xrandr --output $sub_monitor --left-of $remaining_monitor
	    bspc monitor $main_monitor -d 1 2 3 8 9 10
	    bspc monitor $sub_monitor -d  6 7 
	    bspc monitor $remaining_monitor -d 4 5
	else
	    xrandr --output $main_monitor --left-of $sub_monitor
	    bspc monitor $main_monitor -d 1 2 3 4 7 8 9 10
	    bspc monitor $sub_monitor -d 5 6
	fi
    else
	bspc monitor $main_monitor -d 1 2 3 4 5 6 7 8 9 10
    fi
fi

bspc desktop Desktop --remove &
nohup $HOME/.config/polybar/launch-bspwm.sh &
feh --randomize --bg-fill /home/duypham/Pictures/wallpapers &
