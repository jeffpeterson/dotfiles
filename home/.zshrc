source ~/.env
DISABLE_AUTO_UPDATE="true"

ZSH="$HOME/.oh-my-zsh"

setopt noautocd
setopt PROMPT_SUBST
unsetopt AUTO_CD

autoload -U colors && colors
autoload -U compinit
compinit
zstyle ':completion:*' menu select

alias no=note;
alias be='bundle exec';
alias g=git;

osname() {
  uname -a | cut -d " " -f 1 | tr '[:upper:]' '[:lower:]'
}

write_defaults() {
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
  find . -name "*$1*"
}

typeset -F SECONDS=0;

local timer=$SECONDS

preexec() {
  timer=$SECONDS
}

precmd() {
  timer_difference=$(($SECONDS - $timer))
  timer=$SECONDS
}

c() {
  cd ~/code/$(ls ~/code | selecta)
}

elapsed() {
  printf '%.2fs' $timer_difference
}

current_branch() {
  git branchname 2>/dev/null || git commitname 2>/dev/null
}

COMPLETION_WAITING_DOTS=true;
#REPORTTIME=10

plugins=(pm2 git rails bundler ruby coffee osx gem heroku pow powder rvm python npm brew cloudapp rspec jsontools);

[[ (-d "$ZSH") ]] && source "$ZSH/oh-my-zsh.sh";

which reattach-to-user-namespace > /dev/null && which tmux > /dev/null && tmux set-option -g default-command "reattach-to-user-namespace -l zsh" > /dev/null;

source ~/.profile

# source $HOME/code/fuchsia/scripts/fx-env.sh


PROMPT="
%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%{$fg[magenta]%}%~%{$reset_color%} * %{$fg[green]%}\$(current_branch) %{$reset_color%}\$(elapsed) %(?..%{$fg[red]%})(exit %?)
%{$fg[magenta]%}>%{$reset_color%} "

# export NVM_DIR="/Users/jeffpeterson/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

function emulator {
  cd "$ANDROID_HOME/tools" && ./emulator "$@";
}

# opam configuration
test -r /Users/jeffpeterson/.opam/opam-init/init.zsh && . /Users/jeffpeterson/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
