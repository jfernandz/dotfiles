#!/bin/zsh

# Configuring PATH variable
path+=(
  $HOME/.local/bin 
  $HOME/.screenlayout 
  $HOME/.local/share/gem/ruby/3.0.0/bin 
  $HOME/.config/polybar
)


# Atom does need this one to delete files sending them to 
# trash, AUR atom version does not work properly in Arch
# cause cannot find gvfs-trash
export ELECTRON_TRASH=gio


# To start Xorg when logging in tty 1
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
