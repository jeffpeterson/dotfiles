ZSH="$HOME/.oh-my-zsh"

setopt noautocd
autoload -U colors && colors
autoload -U compinit
compinit
zstyle ':completion:*' menu select

alias n=note;
alias be='bundle exec';

setup_environment() {
  defaults write    com.apple.Dock   autohide-delay               -float 0;
  defaults write    com.apple.dock   tilesize                     -int   10
  defaults write    com.apple.dock   autohide                     -bool  YES;
  defaults write    com.apple.dock   expose-animation-duration    -float 0.12;
  defaults write    com.apple.finder QLEnableTextSelection        -bool  YES;
  defaults write -g ApplePressAndHoldEnabled                      -bool  NO;
  defaults write    com.apple.dashboard mcx-disabled              -bool  YES;
  defaults write    com.apple.mouse.tapBehavior                   -bool  YES;
  defaults write    com.apple.trackpad.enableSecondaryClick       -bool  YES;
  defaults write    .GlobalPreferences com.apple.trackpad.scaling -float 2;
  killall Dock

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
  find . -name "*$1*"
}

COMPLETION_WAITING_DOTS=true;

plugins=(git rails bundler ruby coffee osx gem heroku pow powder rvm python github brew cloudapp rspec);

[[ (-d "$ZSH") ]] && source "$ZSH/oh-my-zsh.sh";

which reattach-to-user-namespace > /dev/null && which tmux > /dev/null && tmux set-option -g default-command "reattach-to-user-namespace -l zsh" > /dev/null;

export CDPATH="$CDPATH:$HOME/code:$HOME/work"
export EDITOR=vim
export TZ=America/Los_Angeles
export VIM_APP_DIR="$HOME/Applications"
export VISUAL=vim

PROMPT="%{$fg[magenta]%}> %{$reset_color%}"
RPROMPT="%{$fg[green]%}\$(current_branch) %{$fg[red]%}%~ %{$fg[yellow]%}%n%{$reset_color%} %{$fg[blue]%}%m%{$reset_color%}"

