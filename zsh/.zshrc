#
# User configuration sourced by interactive shells
#

powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh


# Aliases

alias sudo='sudo ' rm='rm -i'  # causes 'sudo rm' to expand to 'sudo rm -i'
alias rm='rm -I'
alias i="curl -F 'f:1=<-' ix.io"
alias pyh="curl -F 'f:1=<-' paste.pound-python.org"
alias ls='ls --color'

#alias yay='yay --noconfirm'


# I do not need that if the remote host has the file ~/.terminfo/x/xterm-termite
# It could be obtained from /usr/share/terminfo/x/xterm-termite in any ArchLinux OS
#alias ssh='TERM=xterm-color ssh'

neofetch

# This binary avoids paste things everywhere with middle mouse click
if ! pgrep -u $USER -fx "xmousepasteblock" >/dev/null 2>&1
then
    exec xmousepasteblock &!
    #echo "Running"
fi

# Start tmux by default, not too useful in a desktop workstation, I prefer this just in a server
#if [ -z "$TMUX"  ]
#then
#    tmux attach -t 0 || tmux new -s 0
#fi

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh


# Testing auto spawn for ssh-askpass in nautilus/thunar when not using Gnome
# Gnome keyring when using i3
#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start)
#    export SSH_AUTH_SOCK
#fi
# Using ssh-agent
#eval $(ssh-agent)

