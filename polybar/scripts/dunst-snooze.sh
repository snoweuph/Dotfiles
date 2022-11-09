#!/bin/sh

case "$1" in
    --toggle)
        dunstctl set-paused toggle
        ;;
    *)
        if [ "$(dunstctl is-paused)" = "true" ]; then
            echo "%{F$2} $(dunstctl count waiting)"
        else
            echo "%{F$1} $(dunstctl count displayed)"
        fi
        ;;
esac
