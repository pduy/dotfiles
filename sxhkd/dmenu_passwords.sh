#!/usr/bin/env bash

user_or_pass=$(echo -e "user\npass" | dmenu -i "$@")

if [[ $user_or_pass == "user" ]]; then
    choice=$(pass ls | awk '{print $(NF)}' | dmenu -i "$@")
    if [[ $choice ]]; then
	echo $choice
	found=$(pass show internet/$choice || pass show work/$choice)
	login=$(echo $found | awk -F ' ' '{print $3}')
	echo $login | xclip -selection clipboard
    fi
elif [[ $user_or_pass == "pass" ]]; then
    choice=$(pass ls | awk '{print $(NF)}' | dmenu -i "$@")
    if [[ $choice ]]; then
	echo $choice
	found=$(pass show -c internet/$choice || pass show -c work/$choice)
    fi
fi
