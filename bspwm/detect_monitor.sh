#! /bin/bash

x=$(xrandr | grep " connected" | cut -d" " -f1)
x_no_edp_1=$(echo $x | sed -e "s/eDP-1//")

main_monitor=""
sub_monitor=""
remaining_monitor=""

if [[ $x_no_edp_1 == *"[DP-1"* ]]; then
    main_monitor="DP-1"
elif [[ $x == *"DVI-I-2-2"* ]]; then
    main_monitor="DVI-I-2-2"
elif [[ $x == *"DVI-I-1-1"* ]]; then
    main_monitor="DVI-I-1-1"
else
    main_monitor="eDP-1"
fi

x=$(echo $x | sed -e "s/[^e]$main_monitor\s*//")

if [[ $x == *"DVI-I-1-1"* ]]; then
    sub_monitor="DVI-I-1-1"
elif [[ $x == *"DVI-I-2-2" ]]; then
    sub_monitor="DVI-I-2-2"
elif [[ $x != *"eDP-1"* ]]; then
    sub_monitor="eDP-1"
fi

remaining_monitor=$(echo $x | sed -e "s/\s*$sub_monitor\s*//")
if [[ $remaining_monitor == *"eDP-1"* ]];then
    remaining_monitor="eDP-1"
fi

export MAIN_MONITOR=$main_monitor
export SUB_MONITOR=$sub_monitor
export REMAINING_MONITOR=$remaining_monitor

