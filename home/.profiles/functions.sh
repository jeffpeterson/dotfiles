write_defaults() {
  defaults write    com.apple.Dock   autohide-delay               -float 0;
  defaults write    com.apple.dock   tilesize                     -int   10
  defaults write    com.apple.dock   autohide                     -bool  YES;
  defaults write    com.apple.dock   expose-animation-duration    -float 0.12;
  defaults write    com.apple.finder QLEnableTextSelection        -bool  YES;
  defaults write -g ApplePressAndHoldEnabled                      -bool  NO;
  # defaults write    com.apple.dashboard mcx-disabled              -bool  YES;
  # defaults write    com.apple.mouse.tapBehavior                   -bool  YES;
  # defaults write    com.apple.trackpad.enableSecondaryClick       -bool  YES;
  defaults write    .GlobalPreferences com.apple.trackpad.scaling -float 2;
  killall Dock
}

setup_environment() {
  write_defaults()
  # set capslock to control
  # ls ~/Library/Preferences/ByHost/.GlobalPreferences.*.plist |
  #   sed -e 's/^.*ces\///' -e 's/\.plist$//' |
  #   xargs -n1 -I{} defaults write {} com.apple.keyboard.modifiermapping.1452-597-0 -dict HIDKeyboardModifierMappingDst 2 HIDKeyboardModifierMappingSrc 0

  if [ ! -d ~/.oh-my-zsh ]; then
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
    . ~/.zshrc
  fi

  if [ ! -d ~/.vim/bundle/vundle ]; then
    git clone --depth=1 https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle;
  fi
}

# drop 10 file1
drop() {
  tail -c +$1 ${@[2, -1]}
}

# trash file1 file2 file3
trash() {
  mv $@ ~/.Trash/
}

f() {
  find . -name "*$1*" "${@:2}"
}

c() {
  cd ~/code/$*
}

# after `tmux a` on a server, run fix-ssh to fix agent forwarding
fix-ssh() {
  eval $(tmux show-env -s |grep '^SSH_')
}
