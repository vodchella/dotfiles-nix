#!/bin/sh

xxkb &
pipewire &
wireplumber &

setxkbmap \
    -layout us,ru \
    -option grp:alt_space_toggle \
    -option ctrl:nocaps
