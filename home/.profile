
PADD=$HOME/bin
# PADD=$PADD:/usr/local/opt/node@4/bin
PADD=$PADD:/usr/local/bin
PADD=$PADD:/usr/local/sbin
PADD=$PADD:/usr/local/heroku/bin
PADD=$PADD:/usr/local/share/npm/bin
PADD=$PADD:/usr/local/opt/ccache/libexec
PADD=$PADD:/usr/local/opt/go/libexec/bin
PADD=$PADD:$ANDROID_HOME/tools
PADD=$PADD:$ANDROID_HOME/platform-tools
PADD=$PADD:$HOME/code/go/projects/bin
PADD=$PADD:$HOME/.cargo/bin
PADD=$PADD:$HOME/code/arcanist/bin
PADD=$PADD:$HOME/code/autobin
PADD=$PADD:$HOME/code/fuchsia/.jiri_root/bin
PADD=$PADD:$HOME/code/flutter/bin

export PATH="$PADD:$PATH"
# export CDPATH="$CDPATH:$HOME/code:$HOME/work"
export EDITOR=vim
export TZ=America/Los_Angeles
export VIM_APP_DIR="$HOME/Applications"
export VISUAL=code
export FUCHSIA_BUILD_DIR=$HOME/code/fuchsia/out/x64
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home
