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


echo -e "\e[1m\e[31mCopying my custom versions to ./polybar-scripts_custom folder in order to create a .patch. This is also a way to backup the folder.\e[0m"
cp -r ./polybar-scripts ./polybar-scripts_custom
echo -e "\e[1m\e[31mAfter this process you should be able to remove it manually if you think it's convenient.\e[0m"


echo -e "\n\e[1m\e[31mCloning raw scripts from Github repo.\e[0m"
wget -q --show-progress -O ./polybar-scripts/info-softwarecounter.py https://raw.githubusercontent.com/WyRe/polybar-scripts/master/polybar-scripts/info-softwarecounter/info-softwarecounter.py
wget -q --show-progress -O ./polybar-scripts/openweathermap-fullfeatured.sh https://raw.githubusercontent.com/WyRe/polybar-scripts/master/polybar-scripts/openweathermap-fullfeatured/openweathermap-fullfeatured.sh
wget -q --show-progress -O ./polybar-scripts/info-hackspeed.sh https://raw.githubusercontent.com/WyRe/polybar-scripts/master/polybar-scripts/info-hackspeed/info-hackspeed.sh
wget -q --show-progress -O ./polybar-scripts/system-cpu-frequency.sh https://raw.githubusercontent.com/WyRe/polybar-scripts/master/polybar-scripts/system-cpu-frequency/system-cpu-frequency.sh
wget -q --show-progress -O ./polybar-scripts/system-cpu-temppercore.sh https://raw.githubusercontent.com/WyRe/polybar-scripts/master/polybar-scripts/system-cpu-temppercore/system-cpu-temppercore.sh
wget -q --show-progress -O ./polybar-scripts/system-nvidia-smi.sh https://raw.githubusercontent.com/WyRe/polybar-scripts/master/polybar-scripts/system-nvidia-smi/system-nvidia-smi.sh
wget -q --show-progress -O ./polybar-scripts/system-usb-udev.sh https://raw.githubusercontent.com/WyRe/polybar-scripts/master/polybar-scripts/system-usb-udev/system-usb-udev.sh
wget -q --show-progress -O ./polybar-scripts/updates-pacman-aurhelper.sh https://raw.githubusercontent.com/WyRe/polybar-scripts/master/polybar-scripts/updates-pacman-aurhelper/updates-pacman-aurhelper.sh


echo -e "\n\e[1m\e[31mDo you want to create the patch (y/N)?\e[0m"
read -n 1 answer
[ -z "$answer" ] && answer="n"
case ${answer:0:1} in
    y|Y )
	echo -e "\n\e[1m\e[31mPatch file has been created as 'scripts.patch'\e[0m"
	diff -ruN --color ./polybar-scripts/ ./polybar-scripts_custom/ > ./scripts.patch
	echo -e "\e[1m\e[34mBe careful!! => \e[31mThere is a 'static_scripts.patch' which has been created moving manually 'scripts.patch' to 'static_scripts.patch'\e[0m"
	echo -e "\e[1m\e[31mThis is the pach which is being applied, so you must check before the new created patch.\e[0m"
    ;;
    * )
        echo -e "\n\e[1m\e[31mNo patch has been created.\e[0m"
    ;;
esac


echo -e "\n\e[1m\e[31mDo you want to apply 'static_scripts.patch' (Y/n)?\e[0m"
read -n 1 answer
[ -z "$answer" ] && answer="y"
case ${answer:0:1} in
    y|Y )
	echo -e "\n\e[1m\e[31mApplying 'static_scripts.patch':\e[0m"
	patch -p1 < ./static_scripts.patch
    ;;
    * )
        echo -e "\n\e[1m\e[31mNo patch has been applied.\e[0m"
    ;;
esac


echo -e "\n\e[1m\e[31mScripts has been patched with 'static_scripts.path'\e[0m"
echo -e "\e[1m\e[34mIMPORTANT!! => \e[31mYou can now check how was the update and if all is right remove the './polybar-script_custom' folder\e[0m"

#trash-put ./polybar-scripts_custom ./scripts.patch


