#! /bin/bash

len=$(bspc query --monitors --names | wc -l)

if [[ $len == 1 ]]
then
    bspc monitor $(bspc query --monitors --names | head -1) -d 1 2 3 4 5 6 7 8 9 10
elif [[ $len == 2 ]]
then
    bspc monitor $(bspc query --monitors --names | head -1) -d 1 2 3 4 7 8 9 10
    bspc monitor $(bspc query --monitors --names | head -2 | tail -1) -d 5 6
else
    bspc monitor $(bspc query --monitors --names | head -1) -d 1 2 3 4 
    bspc monitor $(bspc query --monitors --names | head -2 | tail -1) -d 7 8 9 10
    bspc monitor $(bspc query --monitors --names | head -3 | tail -1) -d 5 6
fi

