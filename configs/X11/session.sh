#!/bin/sh

export QT_STYLE_OVERRIDE=kvantum
export XCURSOR_THEME=Oxygen-White
export XCURSOR_SIZE=24

xrandr --output eDP-1 --scale 0.5x0.5
xrdb -merge "$HOME/.Xresources"

xxkb &
pipewire &
wireplumber &

setxkbmap \
    -layout us,ru \
    -option grp:alt_space_toggle \
    -option ctrl:nocaps
