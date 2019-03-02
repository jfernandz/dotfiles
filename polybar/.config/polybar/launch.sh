#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
killall -q megasync

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar main &
polybar sysinfo &

echo "Bars launched..."
echo "Reloading megasync client..."
megasync &
