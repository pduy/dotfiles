#! /bin/bash

if [ $# -eq 1 ]
then
    bspc monitor $1 -d 1 2 3 4 5 6 7 8 9 10
elif [ $# -eq 2 ]
then
    bspc monitor $1 -d 1 2 3 4 6 7 8 9 10
    bspc monitor $2 -d 5
elif [ $# -eq 3 ]
then
    bspc monitor $1 -d 1 2 3 4 8 9 10
    bspc monitor $2 -d 6 7
    bspc monitor $3 -d 5
else
    x=$(xrandr | grep " connected" | cut -d" " -f1)
    x_no_edp_1=$(echo $x | sed -e "s/eDP-1//")

    main_monitor=""
    sub_monitor=""
    remaining_monitor=""

    if [[ $x_no_edp_1 == *"DP-1"* ]]; then
	main_monitor="DP-1"
    elif [[ $x_no_edp_1 == *"DP-2-1"* ]]; then
	main_monitor="DP-2-1"
    elif [[ $x_no_edp_1 == *"DP-2-2"* ]]; then
	main_monitor="DP-2-2"
    else
	main_monitor="eDP-1"
    fi

    x=$(echo $x | sed -e "s/[^e]$main_monitor\s*//")

    if [[ $x == *"DVI-I-1-1"* ]]; then
	sub_monitor="DVI-I-1-1"
    elif [[ $x == *"DVI-I-2-2" ]]; then
	sub_monitor="DVI-I-2-2"
    elif [[ $x == *"eDP-1"*  && $main_monitor != *"eDP-1"* ]]; then
	sub_monitor="eDP-1"
    fi

    remaining_monitor=$(echo $x | sed -e "s/\s*$sub_monitor\s*//")
    if [[ $remaining_monitor == *"eDP-1"* ]]; then
	remaining_monitor="eDP-1"
    fi

    xrandr --output $main_monitor --left-of $sub_monitor --primary
    xrandr --output $remaining_monitor --below $main_monitor

    echo $main_monitor
    echo $sub_monitor
    echo $remaining_monitor

    if [[ $sub_monitor != "" ]]; then
	if [[ $remaining_monitor != "" ]]; then
	    bspc monitor $main_monitor -d 1 2 3 4 8 9 10
	    bspc monitor $sub_monitor -d 6 7 
	    bspc monitor $remaining_monitor -d 5
	    xrandr --output $main_monitor --right-of $sub_monitor --primary
	    xrandr --output $remaining_monitor --below $main_monitor
	else
	    bspc monitor $main_monitor -d 1 2 3 4 6 7 8 9 10
	    bspc monitor $sub_monitor -d 5
	    xrandr --output $main_monitor --left-of $sub_monitor --primary
	fi
    else
	bspc monitor $main_monitor -d 1 2 3 4 5 6 7 8 9 10
    fi
fi

bspc desktop Desktop --remove &
nohup $HOME/.config/polybar/launch.sh &
