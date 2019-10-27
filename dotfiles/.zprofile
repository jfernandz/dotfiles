export PATH="$PATH:$HOME/.config/polybar/"
export PATH="$PATH:$HOME/.screenlayout/"
export PATH="$PATH:$HOME/home/wyre/.local/bin"


# Atom does need this one to delete files sending them to 
# trash, AUR atom version does not work properly in Arch
# cause cannot find gvfs-trash
export ELECTRON_TRASH=gio


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx