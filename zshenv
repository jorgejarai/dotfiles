#!/usr/bin/env zsh

# $PATH
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/Contents/Home/"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/Library/Python/3.8/bin:$HOME/Library/Python/3.9/bin"

export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
export MANPATH=$HOME/perl5/man:$MANPATH

# Locales
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Cargo
. "$HOME/.cargo/env"

# Appearance
export BAT_THEME="GitHub"
export LS_COLORS="$(cat ~/.config/ls_colors)"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--color=light --border=rounded --height=60%'

# Default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
