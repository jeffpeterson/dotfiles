ZSH="$HOME/.oh-my-zsh"

autoload -U colors && colors
autoload -U compinit
compinit
zstyle ':completion:*' menu select

alias n=note;

function setup_environment() {
  defaults write com.apple.Dock autohide-delay -float 0;
  defaults write com.apple.dock expose-animation-duration -float 0.12;
  defaults write com.apple.finder QLEnableTextSelection -bool TRUE;
  defaults write -g ApplePressAndHoldEnabled -bool false;
  defaults write com.apple.dashboard mcx-disabled -boolean YES;

  if [ ! -d ~/.oh-my-zsh ]; then
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
    . ~/.zshrc
  fi

  if [ ! -d ~/.vim/bundle/vundle ]; then
    git clone --depth=1 https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle;
  fi
}

function f() {
  find . -name "*$1*"
}

COMPLETION_WAITING_DOTS=true;

plugins=(git rails ruby coffee osx gem heroku lein pow powder rvm python github brew cloudapp rspec);

[[ (-d "$ZSH") ]] && source "$ZSH/oh-my-zsh.sh";

which reattach-to-user-namespace > /dev/null && which tmux > /dev/null && tmux set-option -g default-command "reattach-to-user-namespace -l zsh" > /dev/null;

export CDPATH="$CDPATH:$HOME/code:$HOME/work"
export EDITOR=vim
export TZ=America/Chicago
export VIM_APP_DIR="$HOME/Applications"
export VISUAL=vim

PROMPT="%{$fg[magenta]%}> %{$reset_color%}"
RPROMPT="%{$fg[green]%}\$(current_branch) %{$fg[red]%}%~ %{$fg[yellow]%}%n%{$reset_color%} %{$fg[blue]%}%m%{$reset_color%}"

