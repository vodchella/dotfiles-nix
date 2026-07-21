#!/bin/sh

# sudo xbps-install -S kvantum
export QT_STYLE_OVERRIDE=kvantum

xxkb &
pipewire &
wireplumber &

setxkbmap \
    -layout us,ru \
    -option grp:alt_space_toggle \
    -option ctrl:nocaps
