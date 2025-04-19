#!/bin/bash

WATCHFILE="/run/kb-appleusb-present"

echo "[kb-watcher] Starting layout watcher for user session"

# Ensure fallback layout first
setxkbmap -layout us -model pc105

while true; do
    inotifywait -qe create,delete,close_write "$(dirname "$WATCHFILE")" || sleep 1
    if [ -f "$WATCHFILE" ]; then
        echo "[kb-watcher] Apple keyboard present. Switching to Mac layout"
        setxkbmap -layout us -model mac
    else
        echo "[kb-watcher] Apple keyboard absent. Switching to PC layout"
        setxkbmap -layout us -model pc105
    fi
done
