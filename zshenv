#!/usr/bin/env zsh

# Java
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# .local/bin
export PATH="$PATH:$HOME/.local/bin"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Perl
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
export MANPATH=$HOME/perl5/man:$MANPATH

# Locales
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Cargo
. "$HOME/.cargo/env"

# NVM
export NVM_DIR=~/.nvm
export NODE_VERSION=16.14.2

[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh && nvm use 16.14.2 > /dev/null

# Raspberry Pi Pico
export PICO_SDK_PATH=$HOME/opt/pico-sdk
export PICO_EXTRAS_PATH=$HOME/opt/pico-extras

# x86 cross compiler
export PATH="$HOME/opt/cross/bin:$PATH"

# API keys
[ -f "$HOME/.config/api_keys.sh" ] && . "$HOME/.config/api_keys.sh"

# Proxy settings
ip addr | grep 192.168.40 > /dev/null 2>&1 && 
export http_proxy=http://192.168.40.1:3128 &&
export https_proxy=$http_proxy &&
export ftp_proxy=$http_proxy &&
export rsync_proxy=$http_proxy &&
export no_proxy="localhost,127.0.0.1,localaddress,.udec.cl"

# Miscellaneous
export BAT_THEME="GitHub"

# Custom ls colors
export LS_COLORS="$(cat ~/.config/ls_colors)"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f' export FZF_DEFAULT_OPTS='--color=light --border=rounded --height=60%'

# Bun
export BUN_INSTALL="/home/jorge/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Google Chrome executable
export CHROME_EXECUTABLE="google-chrome-stable"

# Ruby gems
export PATH="/home/jorge/.local/share/gem/ruby/3.0.0/bin:$PATH"

# DJGPP cross-compiler
export PATH="/home/jorge/opt/djgpp/bin:$PATH"

# AMPL
export PATH="/home/jorge/opt/ampl:$PATH"

# Gurobi license file
export GRB_LICENSE_FILE="/home/jorge/opt/gurobi.lic"

# Cargo: Use git executable for fetching
export CARGO_NET_GIT_FETCH_WITH_CLI=true
