#!/bin/bash

red=$(tput setaf 1)
green=$(tput setaf 2)
reset=$(tput sgr0)
bold=$(tput bold)


scripts=(
    "info-softwarecounter.py"
    "openweathermap-fullfeatured.sh"
    "info-hackspeed.sh"
    "system-cpu-frequency.sh"
    "system-cpu-temppercore.sh"
    "system-nvidia-smi.sh"
    "system-usb-udev.sh"
    "updates-pacman-aurhelper.sh"
)


printf "$bold$red%s$reset\n" "Downloading raw scripts from Github repo..."
for script in "${scripts[@]}"; do
    wget -q --show-progress -O ./polybar-scripts/"$script" https://raw.githubusercontent.com/jfernandz/polybar-scripts/custom-fixes/polybar-scripts/"${script%.*}"/"$script"
done
printf "$bold$green%s$reset\n" "Done."
