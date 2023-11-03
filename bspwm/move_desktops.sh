#! /bin/bash
#

if [ $# -eq 1 ]
then
    bspc monitor $1 -d 1 2 3 4 5 6 7 8 9 10
elif [ $# -eq 2 ]
then
    bspc monitor $1 -d 1 2 3 4 7 8 9 10
    bspc monitor $2 -d 5 6
elif [ $# -eq 3 ]
then
    bspc monitor $1 -d 1 2 3 4
    bspc monitor $2 -d 7 8 9 10
    bspc monitor $3 -d 5 6
else
    x=$(xrandr)


    main_monitor=""
    sub_monitor=""
    remaining_monitor=""

    if [[ $x == *"HDMI-1 connected"* ]]; then
	main_monitor="HDMI-1"
    elif [[ $x == *"DP-1 connected"* ]]; then
	main_monitor="DP-1"
    elif [[ $x == *"DP-3-1 connected"* ]]; then
	main_monitor="DP-3-1"
    else
	main_monitor="eDP-1"
    fi

    x=$(echo $x | sed -e "s/[^e]$main_monitor\s*//")

    if [[ $x == *"DP-1 connected"* ]]; then
	sub_monitor="DP-1"
    elif [[ $x == *"HDMI-1 connected"* ]]; then
	sub_monitor="HDMI-1"
    elif [[ $x == *"eDP-1 connected"*  && $main_monitor != *"eDP-1"* ]]; then
	sub_monitor="eDP-1"
    fi

    if [[ $sub_monitor != "eDP-1" ]]; then
	remaining_monitor="eDP-1"
    fi

    echo $main_monitor
    echo $sub_monitor
    echo $remaining_monitor

    if [[ $sub_monitor != "" ]]; then
	if [[ $remaining_monitor != "" ]]; then
	    xrandr --output $main_monitor --left-of $remaining_monitor &&\
	    xrandr --output $remaining_monitor --left-of $sub_monitor &&\
	    bspc desktop 1 --to-monitor $main_monitor &&\
	    bspc desktop 2 --to-monitor $main_monitor &&\
	    bspc desktop 3 --to-monitor $main_monitor &&\
	    bspc desktop 4 --to-monitor $main_monitor &&\
	    bspc desktop 5 --to-monitor $remaining_monitor &&\
	    bspc desktop 6 --to-monitor $remaining_monitor &&\
	    bspc desktop 7 --to-monitor $sub_monitor &&\
	    bspc desktop 8 --to-monitor $sub_monitor &&\
	    bspc desktop 9 --to-monitor $sub_monitor &&\
	    bspc desktop 10 --to-monitor $sub_monitor
	else
	    xrandr --output $main_monitor --left-of $sub_monitor &&\
	    bspc desktop 1 --to-monitor $main_monitor &&\
	    bspc desktop 2 --to-monitor $main_monitor &&\
	    bspc desktop 3 --to-monitor $main_monitor &&\
	    bspc desktop 4 --to-monitor $main_monitor &&\
	    bspc desktop 5 --to-monitor $sub_monitor  &&\
	    bspc desktop 6 --to-monitor $sub_monitor  &&\
	    bspc desktop 7 --to-monitor $main_monitor &&\
	    bspc desktop 8 --to-monitor $main_monitor &&\
	    bspc desktop 9 --to-monitor $main_monitor &&\
	    bspc desktop 10 --to-monitor $main_monitor
	fi
    else
	bspc desktop 1 --to-monitor $main_monitor &&\
	bspc desktop 2 --to-monitor $main_monitor &&\
	bspc desktop 3 --to-monitor $main_monitor &&\
	bspc desktop 4 --to-monitor $main_monitor &&\
	bspc desktop 5 --to-monitor $main_monitor &&\
	bspc desktop 6 --to-monitor $main_monitor &&\
	bspc desktop 7 --to-monitor $main_monitor &&\
	bspc desktop 8 --to-monitor $main_monitor &&\
	bspc desktop 9 --to-monitor $main_monitor &&\
	bspc desktop 10 --to-monitor $main_monitor
    fi
fi

bspc desktop Desktop --remove &
nohup $HOME/.config/polybar/launch-bspwm.sh &
feh --randomize --bg-fill /home/duypham/Pictures/wallpapers &

