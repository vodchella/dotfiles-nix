#!/bin/sh

# sudo xbps-install -S kvantum
export QT_STYLE_OVERRIDE=kvantum

xrandr --output eDP-1 --scale 0.5x0.5

xxkb &
pipewire &
wireplumber &

setxkbmap \
    -layout us,ru \
    -option grp:alt_space_toggle \
    -option ctrl:nocaps
