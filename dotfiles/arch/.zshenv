#!/bin/zsh

# Configuring PATH variable
path+=(
  $HOME/.local/bin 
  $HOME/.screenlayout 
  $HOME/.local/share/gem/ruby/3.0.0/bin 
  $HOME/.config/polybar
)
typeset -U path

# Alternative but I think this is for ~/.zshrc
#custom_path=(
#  $HOME/.local/bin
#  $HOME/.screenlayout
#  $HOME/.local/share/gem/ruby/3.0.0/bin
#  $HOME/.config/polybar
#)
#path=( $^custom_path $^path )
#path=( ${(u)^path}(N) )
#export PATH


# Atom does need this one to delete files sending them to 
# trash, AUR atom version does not work properly in Arch
# cause cannot find gvfs-trash
export ELECTRON_TRASH=gio
export GSK_RENDERER=gl
