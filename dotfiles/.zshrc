# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall
#
#zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors \
  "di=1;36" "ln=35" "so=32" "pi=33" "ex=31" "bd=34;46" "cd=34;43" \
  "su=30;41" "sg=30;46" "tw=30;42" "ow=30;43"

# Small letters will match small and capital letters. (i.e. capital letters match only capital letters.)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Sourcing syntax-highlighting and autosuggestions
#
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Lines configured by zsh-newuser-install
#
# Modifying the shell history path and giving 
# The largest size possible [which is $((1<<63 - 1))]
HISTFILE="$HOME/.zhs_history"
HISTSIZE=$((1<<63 - 1))
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
#bindkey -v
# End of lines configured by zsh-newuser-install

#neofetch

# Colors
#
#export TERM="xterm-256color"
export EDITOR='/usr/bin/nvim'
export SUDO_EDITOR=${EDITOR}
export VISUAL=${EDITOR}
export PYTHONFAULTHANDLER=1

######################################
# I only need to export SSH_AUTH_SOCK
# variable in Contabo's server because
# for desktop PCs or laptos I'm using
# gnome-keyring instead ssh-agent
#
CTBO_HOST="contabo"
RPI_HOST="raspberrypi"
if [[ $HOST == *"$CTBO_HOST"* ]] || [[ $HOST == *"$RPI_HOST"* ]] && [[ $USER != "root" ]]; then
	if ! [[ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]]; then 
    ssh-agent -t 1h -a "$XDG_RUNTIME_DIR/ssh-agent.socket"; 
  fi
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
######################################

# $PATH
#
# This one is not proper for a system-wide (rofi needs that)
#export PATH="$PATH:$HOME/.config/polybar/"
# This other one seems like more system-wide
# but is not secure.
#source /etc/environment

# The most appropriate way to setup the $PATH varible is inside 
# ~/.zprofile, but to fetch that info you need to setup the following
# command in order to source that ~/.zprofile, So you must add the 
# following to your ~/.xprofile (which is fetched by GDM)
        
        # command="/bin/zsh -l -c gnome-session-i3"

# Then ~/.zlogin will be fetched and you have your new $PATH stablished


# Aliases
#
alias sudo='sudo ' rm='rm -i'  # causes 'sudo rm' to expand to 'sudo rm -i'
#alias rm='rm -I'
alias trash='trash-put'
alias del='trash-put'
alias rm="echo Use 'del' or the full path i.e. '/bin/rm'"
alias bp="curl -X POST https://bpa.st/curl -F 'raw=<-' -F 'lexer=python'"
alias i="curl -F 'f:1=<-' ix.io"
alias rs="curl --data-binary @- https://paste.rs"
alias ptpb="curl -F c=@- https://ptpb.pw/"
alias ptpbsh="curl -F c=@- https://ptpb.pw/u"
alias ls='lsd'
#alias ls='ls --color'
alias vim='nvim'
alias ytdl-mp3='youtube-dl -x --audio-quality 0 --audio-format mp3'
#alias grep="grep --color=always"

# ibus
#
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


# ZIM
#       system-wide? 
# Define zim location
#export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Start zim
#[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh


# ZSH custom options
#
# Colors in autocomplete
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=value'
##################################################################
# Suggestion from osse in #zsh (freenode), The problem between my
# laptop and my rpi is that my laptop reports "^[[A" when for up 
# arrow in the keyboard whil the rpi reports "^[OA" so I need a 
# better way to set up the bindkeys.
# 
# I just actually need to bind key for history-beginning-search-backward
# but due this difference in the keymodes ("^[[A" vs "^[OA") it was
# not working as expected.
#
# Code for sane binding of keys and handling of terminal modes {{{
# Adapted from Debian's /etc/zshrc
typeset -A key
key=( BackSpace  "${terminfo[kbs]}"
      Home       "${terminfo[khome]}"
      End        "${terminfo[kend]}"
      Insert     "${terminfo[kich1]}"
      Delete     "${terminfo[kdch1]}"
      Up         "${terminfo[kcuu1]}"
      Down       "${terminfo[kcud1]}"
      Left       "${terminfo[kcub1]}"
      Right      "${terminfo[kcuf1]}"
      PageUp     "${terminfo[kpp]}"
      PageDown   "${terminfo[knp]}"
)

function bind2maps () {
    local i sequence widget
    local -a maps

    while [[ "$1" != "--" ]]; do
        maps+=( "$1" )
        shift
    done
    shift

    sequence="${key[$1]}"
    widget="$2"

    [[ -z "$sequence" ]] && return 1

    for i in "${maps[@]}"; do
        bindkey -M "$i" "$sequence" "$widget"
    done
}

bind2maps emacs             -- BackSpace   backward-delete-char
bind2maps       viins       -- BackSpace   vi-backward-delete-char
bind2maps             vicmd -- BackSpace   vi-backward-char
bind2maps emacs             -- Home        beginning-of-line
bind2maps       viins vicmd -- Home        vi-beginning-of-line
bind2maps emacs             -- End         end-of-line
bind2maps       viins vicmd -- End         vi-end-of-line
bind2maps emacs viins       -- Insert      overwrite-mode
bind2maps             vicmd -- Insert      vi-insert
bind2maps emacs             -- Delete      delete-char
bind2maps       viins vicmd -- Delete      vi-delete-char
bind2maps emacs viins vicmd -- Up          history-beginning-search-backward
bind2maps emacs viins vicmd -- Down        history-beginning-search-forward
bind2maps emacs             -- Left        backward-char
bind2maps       viins vicmd -- Left        vi-backward-char
bind2maps emacs             -- Right       forward-char
bind2maps       viins vicmd -- Right       vi-forward-char
bind2maps       viins vicmd -- PageUp      ''
bind2maps       viins vicmd -- PageDown    ''

# Make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        emulate -L zsh
        # indicate-mode
        printf '%s' ${terminfo[smkx]}
    }
    zle -N zle-line-init
    function zle-line-finish () {
        emulate -L zsh
        printf '%s' ${terminfo[rmkx]}
    }
    zle -N zle-line-finish
fi

unfunction bind2maps
##################################################################
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[Z" reverse-menu-complete
##################################################################


# powerlevel10K prompt theme 
#
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
