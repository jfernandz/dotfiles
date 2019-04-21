export PATH="$PATH:$HOME/.config/polybar/"
export PATH="$PATH:$HOME/.screenlayout/"
export PATH="$PATH:$HOME/home/wyre/.local/bin"
export LC_NUMERIC=C



[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
