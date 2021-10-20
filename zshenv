export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/Contents/Home/"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/Library/Python/3.8/bin:$HOME/Library/Python/3.9/bin"

export PATH="$PATH:$HOME/.yarn/bin"

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
export MANPATH=$HOME/perl5/man:$MANPATH

export BAT_THEME="GitHub"

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
. "$HOME/.cargo/env"

#export LDFLAGS="-L/usr/local/opt/llvm/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include"
