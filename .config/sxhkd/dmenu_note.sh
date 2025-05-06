#!/usr/bin/env bash

choice=$(find ~/Documents/vnote_notebooks/ -maxdepth 10 -type f | dmenu -i "$@")
if [[ $choice ]]; then
    echo $choice
    alacritty -e nvim $choice
fi
