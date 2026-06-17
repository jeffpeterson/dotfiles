# export ANDROID_HOME=$HOME/Library/Android/sdk
#
# push $ANDROID_HOME/tools
# push $ANDROID_HOME/platform-tools

emulator() {
  cd "$ANDROID_HOME/tools" && ./emulator "$@";
}
