#!/usr/bin/env bash

choice=$(find ~/Documents/Dropbox/vnote_notebooks/ -maxdepth 10 -type f | dmenu -i "$@")
if [[ $choice ]]; then
    echo $choice
    urxvt -e nvim $choice
fi
