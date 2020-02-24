#!/usr/bin/env bash
# requires jq

current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)

i3-msg "rename workspace $current_workspace to temporary; rename workspace $1 to $current_workspace; rename workspace temporary to $1"
#while read -r name current_workspace; do
    #echo "moving ${current_workspace} right..."
    #i3-msg workspace "${current_workspace}"
    #i3-msg move workspace to output right
#done
