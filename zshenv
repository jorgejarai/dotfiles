#!/usr/bin/env zsh

# Java
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

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

# API keys
[ -f "$HOME/.config/api_keys.sh" ] && source "$HOME/.config/api_keys.sh"

# Default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
