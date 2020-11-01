#!/bin/bash
xrandr --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output eDP1 --off

i3-msg restart
