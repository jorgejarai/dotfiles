#!/usr/bin/env zsh

# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH="$HOME/opt/android-studio/bin:$PATH"

# ~/bin
export PATH="$HOME/bin:$PATH"

# ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# x86 cross compiler
export PATH="$HOME/opt/cross/bin:$PATH"

# Flutter
export PATH="$HOME/opt/flutter/bin:$PATH"

# Cargo
export CARGO_NET_GIT_FETCH_WITH_CLI=true
source "$HOME/.cargo/env"

# Zig
export PATH="$HOME/opt/zig:$PATH"

# API keys
[ -f "$HOME/.config/api_keys.sh" ] && source "$HOME/.config/api_keys.sh"

# Default editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Luarocks
command -v luarocks >/dev/null 2>&1 && eval "$(luarocks path --bin)"

# sccache
RUSTC_WRAPPER=sccache
