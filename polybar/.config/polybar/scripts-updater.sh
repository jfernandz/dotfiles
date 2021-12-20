#!/bin/bash

# 1.
# I've written two different versions, the commented version creates a patch every time I run this scipt. This is not 
# very useful because when upstream changes, the new patch created will cause the removal of updates coming from upstream
# because that new patch created would be created comparing my old version with the new from upstream. My old version would
# not have the updates from upstream, thus those updates will be removed again when the patch applies.

# 2.
# That's why I've created a static patch which will only modify the specific lines; that's not either a proper way because
# if some line moves or the new content of cloned raw scripts varies too much, the patch might fail (that's because I'm
# getting a backup in ./polybar-scripts_custom). In fact this `static_script.patch` file is by now included in the git repo 

# 3.
# The most proper approach to this issue would be to use `awk` or `sed` to parse the files and introduce the appropriate modifications
# in the new raw files, but I still cannot use `awk` or `sed` unfortunately. 

red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
reset=$(tput sgr0)
bold=$(tput bold)
blink=$(tput blink || tput mb)

printf "$bold$red%s$reset\n" "Copying my custom versions to ./polybar-scripts_custom folder in order to create a .patch. This is also a way to backup the folder."
cp -r ./polybar-scripts ./polybar-scripts_custom
printf "$bold$red%s$reset\n" "After this process you should be able to remove it manually if you think it's convenient."

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

printf "$bold$red%s$reset\n" "Cloning raw scripts from Github repo."
for script in "${scripts[@]}"; do
    wget -q --show-progress -O ./polybar-scripts/"$script" https://raw.githubusercontent.com/jfernandz/polybar-scripts/master/polybar-scripts/"${script%.*}"/"$script"
done

printf "$bold$red%s$reset\n" "Do you want to create the patch (y/N)?"
read -n 1 answer
[ -z "$answer" ] && answer="n"
case ${answer:0:1} in
    y|Y )
        printf "\n$bold$red%s$reset\n" "Patch file has been created as 'scripts.patch'"
        git diff -R ./polybar-scripts > ./scripts.patch
        printf "\n$bold$blue%s$red$blink%s$reset\n" "Be careful!! => " "There is a 'personal-patches.patch' which has been created moving MANUALLY 'scripts.patch' to 'personal-patches.patch'"
        printf "\n$bold$red%s$reset\n" "This is the pach which is being applied, so you must check before the new created patch."
    ;;
    * )
        printf "\n$bold$red%s$reset\n" "No patch has been created."
    ;;
esac


printf "$bold$red%s$reset\n" "Do you want to apply 'personal-patches.patch' (Y/n)?"
read -n 1 answer
[ -z "$answer" ] && answer="y"
case ${answer:0:1} in
    y|Y )
        printf "\n$bold$red%s$reset\n" "Applying 'personal-patches.patch':"
        git apply ./personal-patches.patch
    ;;
    * )
        printf "\n$bold$red%s$reset\n" "No patch has been applied."
    ;;
esac

#printf "$bold$red%s$reset\n" "Scripts has been patched with 'personal-patches.path'"
printf "$bold$blue%s$red$blink%s$reset\n" "IMPORTANT!! => " "You can now check how was the update in the case you applied it and if all is right remove the './polybar-script_custom' folder"

#trash-put ./polybar-scripts_custom # ./scripts.patch


