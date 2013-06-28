ZSH="$HOME/.oh-my-zsh"

autoload -U colors && colors
autoload -U compinit
compinit
zstyle ':completion:*' menu select

alias n=note;

function setup_environment() {
  git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  . ~/.zshrc

  git clone --depth=1 https://github.com/gmarik/vundle.git        ~/.vim/bundle/vundle
  vim +BundleInstall +qall
}

function f() {
  find . -name "*$1*"
}

COMPLETION_WAITING_DOTS="true";

plugins=(git rails3 ruby coffee osx gem heroku lein pow powder rvm python github brew clouapp rspec);

[[ (-d "$ZSH") ]] && source "$ZSH/oh-my-zsh.sh";

which reattach-to-user-namespace > /dev/null && which tmux > /dev/null && tmux set-option -g default-command "reattach-to-user-namespace -l zsh" > /dev/null;

CDPATH="$HOME/code:$CDPATH"
EDITOR=vim
PATH="$HOME/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$HOME/.rbenv/bin:$PATH"
TZ=America/Chicago
VIM_APP_DIR="$HOME/Applications"
VISUAL=vim

PROMPT="%{$fg[magenta]%}> %{$reset_color%}"
RPROMPT="%{$fg[green]%}\$(current_branch) %{$fg[red]%}%~ %{$fg[yellow]%}%n%{$reset_color%} %{$fg[blue]%}%m%{$reset_color%}"

