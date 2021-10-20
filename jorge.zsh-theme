PROMPT='%(!.%{$fg[red]%}.%{$fg[green]%})%c%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} %{$fg_bold[yellow]%}%*%{$reset_color%}%F{cyan}${timer_show}%f %F{242%}(%?)%f%{$reset_color%} $(battery_pct_prompt) %# '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="!"
ZSH_THEME_GIT_PROMPT_CLEAN=""
