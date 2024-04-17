#!/bin/usr/env zsh

# Execution time routines (used in prompt)
function preexec() {
    # Use GNU date instead of the BSD version on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        timer=$(($(gdate +%s%0N) / 1000000))
    else
        timer=$(($(date +%s%0N) / 1000000))
    fi
}

function precmd() {
    if [ $timer ]; then
        # Use GNU date instead of the BSD version on macOS
        if [[ "$OSTYPE" == "darwin"* ]]; then
            now=$(($(gdate +%s%0N) / 1000000))
        else
            now=$(($(date +%s%0N) / 1000000))
        fi
        elapsed=$(($now - $timer))

        ms=$((elapsed % 1000))
        s=$(((elapsed / 1000) % 60))
        min=$(((elapsed / 60000) % 60))
        h=$((elapsed / 3600000))

        if ((h > 0)); then
            timer_show=" ${h} h ${min} min"
        elif ((min > 0)); then
            timer_show=" ${min} min ${s} s"
        elif ((s >= 30)); then
            timer_show=" ${s} s"
        elif ((s > 5)); then
            timer_show=" ${s}.$(printf %02d $ms) s"
        else
            timer_show=""
        fi

        unset timer
    fi
}

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jorge"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets root cursor)

plugins=(git zsh-syntax-highlighting battery command-not-found zsh-autosuggestions zsh-z)

source "$ZSH/oh-my-zsh.sh"  

[ -f ~/.config/aliasrc ] && source ~/.config/aliasrc

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--color=light --border=rounded --height=60%"

# Use Alt+Left and Alt+Right for navigating between words
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Appearance settings
export BAT_THEME="GitHub"
export LS_COLORS="$(cat ~/.config/ls_colors)"

export GPG_TTY=$(tty)

. "$HOME/.cargo/env"

# Per-device settings
[ -f "$HOME/.zshrc_local" ] && source "$HOME/.zshrc_local"

