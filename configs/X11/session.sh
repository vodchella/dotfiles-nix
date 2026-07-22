#!/bin/sh

eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/github"
ssh-add "$HOME/.ssh/vpn-srv"

export SSH_AUTH_SOCK
export SSH_AGENT_PID
export QT_STYLE_OVERRIDE=kvantum
export XCURSOR_THEME=Oxygen-White
export XCURSOR_SIZE=24
export XDG_RUNTIME_DIR="/tmp/runtime-$(id -u)"

if [ ! -d "$XDG_RUNTIME_DIR" ]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
fi

xrandr --output eDP-1 --scale 0.5x0.5
xrdb -merge "$HOME/.Xresources"

xxkb &
pipewire &
wireplumber &

setxkbmap \
    -layout us,ru \
    -option grp:alt_space_toggle \
    -option ctrl:nocaps
