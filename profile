#!/bin/bash

export ALTERNATE_EDITOR="mousepad"
export EDITOR="emacs"
export VISUAL="code"
export TERMINAL="xfce4-terminal"
export BROWSER="google-chrome-stable"

export HISTFILE="$HOME/.local/.bash_history"

export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
export PATH="$PATH:$HOME/opt/miktex"
export PATH="$PATH:$HOME/opt/nethack-3.6.6/games/lib/nethackdir"
export PATH="$PATH:$HOME/opt/vcpkg"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export PATH="$PATH:$HOME/.yarn/bin"

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:/opt/flutter/dev/bin

export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export MANPAGER="less -X"
export GPG_TTY=$(tty)

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

export XDG_DOWNLOAD_DIR="/home/jorge/Downloads"

export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
