# Path to your oh-my-zsh installation.
export ZSH="/home/marijnk/.oh-my-zsh"

# Prompt theme
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
path+=('/home/marijnk/bin')

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

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

# Aliases
alias zshconfig="vim ~/.zshrc"
alias pwd='pwd -P'
alias fbserver='wine /home/marijnk/.wine/drive_c/Program\ Files/RelSQL/Firebird/bin/fbserver -a'
alias lsblk='lsblk -e7'
alias ls='ls --color --group-directories-first'
alias copy='xclip -selection clipboard'