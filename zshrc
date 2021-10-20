export ZSH="/Users/jorge/.oh-my-zsh"

ZSH_THEME="jorge"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting battery command-not-found zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.config/aliasrc ]] && source ~/.config/aliasrc

# Execution time routines (used in prompt)
function preexec() {
    timer=$(($(gdate +%s%0N) / 1000000))
}

function precmd() {
    if [ $timer ]; then
        now=$(($(gdate +%s%0N) / 1000000))
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

# All hail FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--color=light --border=rounded --height=60%'

# Map Alt+Left and Alt+Right on Mac systems
if [[ "$OSTYPE" == "darwin"* ]]; then
    bindkey "^[[1;3C" forward-word
    bindkey "^[[1;3D" backward-word
fi

# Custom ls colors
export LS_COLORS="$(cat ~/.config/ls_colors)"
