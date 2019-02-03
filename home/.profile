push() {
  export PATH="$1:$PATH"
}

# push /usr/local/opt/node@4/bin
push /usr/local/bin
push /usr/local/sbin
push /usr/local/heroku/bin
push /usr/local/share/npm/bin
push /usr/local/opt/ccache/libexec
push /usr/local/opt/go/libexec/bin
push /usr/local/opt/ghc@8.2/bin
push $ANDROID_HOME/tools
push $ANDROID_HOME/platform-tools
push $HOME/code/go/projects/bin
push $HOME/.cargo/bin
push $HOME/code/arcanist/bin
push $HOME/code/autobin
push $HOME/code/fuchsia/.jiri_root/bin
push $HOME/code/flutter/bin
push $HOME/.npm-global/bin
push $HOME/bin
push $HOME/sbin

# export CDPATH="$CDPATH:$HOME/code:$HOME/work"
export EDITOR=vim
export TZ=America/Los_Angeles
export VIM_APP_DIR="$HOME/Applications"
export VISUAL=code
export FUCHSIA_BUILD_DIR=$HOME/code/fuchsia/out/x64
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home
export LDFLAGS="-L/usr/local/opt/ghc@8.2/lib"

alias codei=code-insiders
# alias code=code-insiders
