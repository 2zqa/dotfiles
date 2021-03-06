# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Prompt theme
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set vim bindings and add right prompt (credits: Paweł Gościcki)
# Source: http://pawelgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt/
bindkey -v
RPROMPT='${vim_mode}'

vim_ins_mode=""
vim_cmd_mode="%B-- NORMAL --%b"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
} 

# Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Set editor
export EDITOR=/usr/bin/nvim
export VISUAL=$EDITOR

# Path
path+="$HOME/bin"
path+="$HOME/.config/home/marijnk/.config/composer/vendor/bin"

# Functions
mkcd ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Aliases
alias zshconfig="$EDITOR $HOME/.zshrc"
alias zshupdateconfig="source $HOME/.zshrc"
alias pwd='pwd -P'
alias wl-copy='wl-copy --trim-newline'
alias ls='ls --color --group-directories-first'
alias ip='ip -c'

# Hide ugly snap entries
alias lsblk='lsblk -e7'
