export ZSH="/Users/jorge/.oh-my-zsh"

ZSH_THEME="jorge"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.config/aliasrc ]] && source ~/.config/aliasrc

# Execution time routines (used in prompt)
function preexec() {
  timer=$(($(gdate +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(gdate +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    s=$((elapsed / 1000 % 60))
    min=$((s / 60))
    h=$((min / 60))

    if ((h > 0)); then timer_show=" ${h} h ${min} min"
    elif ((min > 0)); then timer_show=" ${min} min ${s} s"
    elif ((s >= 30)); then timer_show=" ${s} s"
    elif ((s > 5)); then timer_show=" ${s}.$(printf %02d $elapsed) s"
    else timer_show=""
    fi

    unset timer
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
