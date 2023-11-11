#!/bin/usr/env zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jorge"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting battery command-not-found zsh-autosuggestions zsh-z)

source "$ZSH/oh-my-zsh.sh"  

[ -f ~/.config/aliasrc ] && source ~/.config/aliasrc

# Load FZF
[ -d /usr/share/doc/fzf ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -d /usr/share/doc/fzf ] && source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--color=light --border=rounded --height=60%'

# Use Alt+Left and Alt+Right for navigating between words
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Per-device settings
[ -f "$HOME/.zshrc_local" ] && source "$HOME/.zshrc_local"

# Appearance settings
export BAT_THEME="GitHub"
export LS_COLORS="$(cat ~/.config/ls_colors)"
