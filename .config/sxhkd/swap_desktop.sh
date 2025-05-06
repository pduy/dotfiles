#! /bin/bash

ws="$(bspc query -D -d --names)"
bspc desktop -s $1 &&\
bspc desktop -n temp &&\
bspc desktop -f $1 &&\
bspc desktop -n $ws &&\
bspc desktop -f temp &&\
bspc desktop -n $1
