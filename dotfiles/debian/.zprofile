# Configuring PATH variable
# I don't like this way because when .zprofile is properly sourced
# you can use the zsh syntax in line 11: path+=(...)
#export PATH="$PATH:$HOME/.config/polybar/"
#export PATH="$PATH:$HOME/.screenlayout/"
#export PATH="$PATH:$HOME/.local/bin"
#export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"

# Another way to set up PATH variable, this is only useful
# when loging via terminal because zsh will parse this .zprofile
# for graphical logins this is not suitable, anyway I need this
# for servers where I'm not using graphical environment
path+=($HOME/.local/bin $HOME/.screenlayout $HOME/.local/share/gem/ruby/3.0.0/bin $HOME/.config/polybar)


# Atom does need this one to delete files sending them to 
# trash, AUR atom version does not work properly in Arch
# cause cannot find gvfs-trash
export ELECTRON_TRASH=gio


# To start Xorg when logging in tty 1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
