#! /bin/bash
#

if [ $# -eq 1 ]
then
    bspc desktop 1 --to-monitor $1
    bspc desktop 2 --to-monitor $1
    bspc desktop 3 --to-monitor $1
    bspc desktop 4 --to-monitor $1
    bspc desktop 5 --to-monitor $1
    bspc desktop 6 --to-monitor $1
    bspc desktop 7 --to-monitor $1
    bspc desktop 8 --to-monitor $1
    bspc desktop 9 --to-monitor $1
    bspc desktop 10 --to-monitor $1
elif [ $# -eq 2 ]
then
    bspc desktop 1 --to-monitor $1
    bspc desktop 2 --to-monitor $1
    bspc desktop 3 --to-monitor $1
    bspc desktop 4 --to-monitor $1
    bspc desktop 5 --to-monitor $2
    bspc desktop 6 --to-monitor $2
    bspc desktop 7 --to-monitor $1
    bspc desktop 8 --to-monitor $1
    bspc desktop 9 --to-monitor $1
    bspc desktop 10 --to-monitor $1
elif [ $# -eq 3 ]
then
    bspc desktop 1 --to-monitor $1
    bspc desktop 2 --to-monitor $1
    bspc desktop 3 --to-monitor $1
    bspc desktop 4 --to-monitor $3
    bspc desktop 5 --to-monitor $3
    bspc desktop 6 --to-monitor $2
    bspc desktop 7 --to-monitor $2
    bspc desktop 8 --to-monitor $1
    bspc desktop 9 --to-monitor $1
    bspc desktop 10 --to-monitor $1
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
	sub_monitor="DP-3"
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
	    bspc desktop 1 --to-monitor $main_monitor
	    bspc desktop 2 --to-monitor $main_monitor
	    bspc desktop 3 --to-monitor $main_monitor
	    bspc desktop 4 --to-monitor $remaining_monitor
	    bspc desktop 5 --to-monitor $remaining_monitor
	    bspc desktop 6 --to-monitor $sub_monitor
	    bspc desktop 7 --to-monitor $sub_monitor
	    bspc desktop 8 --to-monitor $main_monitor
	    bspc desktop 9 --to-monitor $main_monitor
	    bspc desktop 10 --to-monitor $main_monitor
	else
	    xrandr --output $main_monitor --left-of $sub_monitor
	    bspc desktop 1 --to-monitor $main_monitor
	    bspc desktop 2 --to-monitor $main_monitor
	    bspc desktop 3 --to-monitor $main_monitor
	    bspc desktop 4 --to-monitor $main_monitor
	    bspc desktop 5 --to-monitor $sub_monitor
	    bspc desktop 6 --to-monitor $sub_monitor
	    bspc desktop 7 --to-monitor $main_monitor
	    bspc desktop 8 --to-monitor $main_monitor
	    bspc desktop 9 --to-monitor $main_monitor
	    bspc desktop 10 --to-monitor $main_monitor
	fi
    else
	bspc desktop 1 --to-monitor $main_monitor
	bspc desktop 2 --to-monitor $main_monitor
	bspc desktop 3 --to-monitor $main_monitor
	bspc desktop 4 --to-monitor $main_monitor
	bspc desktop 5 --to-monitor $main_monitor
	bspc desktop 6 --to-monitor $main_monitor
	bspc desktop 7 --to-monitor $main_monitor
	bspc desktop 8 --to-monitor $main_monitor
	bspc desktop 9 --to-monitor $main_monitor
	bspc desktop 10 --to-monitor $main_monitor
    fi
fi

bspc desktop Desktop --remove &
nohup $HOME/.config/polybar/launch-bspwm.sh &
feh --randomize --bg-fill /home/duypham/Pictures/wallpapers &

