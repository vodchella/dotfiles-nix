#!/bin/sh

exec dbus-run-session sh -c '
    . /home/vodchella/.config/X11/session.sh
    exec i3
'
