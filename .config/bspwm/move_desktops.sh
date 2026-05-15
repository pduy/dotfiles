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
    bspc desktop 6 --to-monitor $1
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
    primary=$(xrandr | grep "connected primary" | awk '{print $1}')
    extended=$(xrandr | grep " connected" | grep -v "connected primary" | awk '{print $1}')
    echo $primary
    echo $extended
    bspc desktop 1 --to-monitor $primary
    bspc desktop 2 --to-monitor $primary
    bspc desktop 3 --to-monitor $primary
    bspc desktop 4 --to-monitor $primary
    bspc desktop 5 --to-monitor $primary
    bspc desktop 6 --to-monitor $primary
    bspc desktop 7 --to-monitor $primary
    bspc desktop 8 --to-monitor $primary
    bspc desktop 9 --to-monitor $primary
    bspc desktop 10 --to-monitor $primary

    if [ -n "$extended" ]; then
        xrandr --output $primary --left-of $extended
        bspc desktop 11 --to-monitor $extended
    fi

    #x=$(xrandr | grep "connected" | sed -e "s/eDP//g")


    #main_monitor=""
    #sub_monitor=""
    #remaining_monitor=""

    #if [[ $x == *"DisplayPort"* ]]; then
	#main_monitor=$(xrandr | grep -E "DisplayPort-.* connected" | awk '{print $1}')
	## sed -i -E "s/Xft.dpi: [0-9]+/Xft.dpi: 96/g" ~/.Xdefaults && xrdb ~/.Xdefaults
    #else
	#main_monitor="eDP"
	## sed -i -E "s/Xft.dpi: [0-9]+/Xft.dpi: 110/g" ~/.Xdefaults && xrdb ~/.Xdefaults
    #fi

    #x=$(echo $x | sed -e "s/[^e]$main_monitor\s*//")

    #if [[ $x == *"DP-3 connected"* ]]; then
	#sub_monitor="DP-3"
    #elif [[ $x == *"DP-1 connected"* ]]; then
	#sub_monitor="DP-1"
    #elif [[ $x == *"HDMI-1 connected"* ]]; then
	#sub_monitor="HDMI-1"
    #elif [[ $main_monitor != "eDP" ]]; then
	#sub_monitor="eDP"
    #fi

    #if [[ $main_monitor != "eDP" && $sub_monitor != "eDP" ]]; then
	#remaining_monitor="eDP"
    #fi

    #echo $main_monitor
    #echo $sub_monitor
    #echo $remaining_monitor

    #if [[ $sub_monitor != "" ]]; then
	#if [[ $remaining_monitor != "" ]]; then
	    #xrandr --output $main_monitor --left-of $sub_monitor
	    #xrandr --output $sub_monitor --left-of $remaining_monitor
	    #bspc desktop 1 --to-monitor $main_monitor
	    #bspc desktop 2 --to-monitor $main_monitor
	    #bspc desktop 3 --to-monitor $main_monitor
	    #bspc desktop 4 --to-monitor $remaining_monitor
	    #bspc desktop 5 --to-monitor $remaining_monitor
	    #bspc desktop 6 --to-monitor $sub_monitor
	    #bspc desktop 7 --to-monitor $sub_monitor
	    #bspc desktop 8 --to-monitor $main_monitor
	    #bspc desktop 9 --to-monitor $main_monitor
	    #bspc desktop 10 --to-monitor $main_monitor
	#else
	    #xrandr --output $main_monitor --left-of $sub_monitor
	    #bspc desktop 1 --to-monitor $main_monitor
	    #bspc desktop 2 --to-monitor $main_monitor
	    #bspc desktop 3 --to-monitor $main_monitor
	    #bspc desktop 4 --to-monitor $main_monitor
	    #bspc desktop 5 --to-monitor $sub_monitor
	    #bspc desktop 6 --to-monitor $main_monitor
	    #bspc desktop 7 --to-monitor $main_monitor
	    #bspc desktop 8 --to-monitor $main_monitor
	    #bspc desktop 9 --to-monitor $main_monitor
	    #bspc desktop 10 --to-monitor $main_monitor
	#fi
    #else
	#bspc desktop 1 --to-monitor $main_monitor
	#bspc desktop 2 --to-monitor $main_monitor
	#bspc desktop 3 --to-monitor $main_monitor
	#bspc desktop 4 --to-monitor $main_monitor
	#bspc desktop 5 --to-monitor $main_monitor
	#bspc desktop 6 --to-monitor $main_monitor
	#bspc desktop 7 --to-monitor $main_monitor
	#bspc desktop 8 --to-monitor $main_monitor
	#bspc desktop 9 --to-monitor $main_monitor
	#bspc desktop 10 --to-monitor $main_monitor
    #fi
fi

bspc desktop Desktop --remove &
$HOME/.config/polybar/launch.sh &
feh --randomize --bg-fill /home/duy/Pictures/wallpapers &
/home/duy/.config/bspwm/auto_dpi.sh &

