#!/usr/bin/env bash

# Terminate already running bar
killall -q polybar

# Wait for the processes to be shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar top &

