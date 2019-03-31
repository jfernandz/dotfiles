export PATH="$PATH:$HOME/.config/polybar/"
export LC_NUMERIC=C



if [[ ! $DISPLAY && $XDG_VTNE -eq 1 ]]; then
    exec startx
fi
