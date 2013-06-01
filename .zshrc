ZSH="$HOME/.oh-my-zsh"

autoload -U colors && colors
autoload -U compinit
compinit
zstyle ':completion:*' menu select

alias n=note;

COMPLETION_WAITING_DOTS="true";

plugins=(git rails3 ruby coffee osx gem heroku lein pow powder rvm python github brew clouapp rspec);

[[ (-d "$ZSH") ]] && source "$ZSH/oh-my-zsh.sh";

which reattach-to-user-namespace > /dev/null && which tmux > /dev/null && tmux set-option -g default-command "reattach-to-user-namespace -l zsh" > /dev/null;

export PATH="$HOME/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
export CDPATH="$HOME/code:$CDPATH"
export VISUAL=vim
export EDITOR=vim

PROMPT="%{$fg[magenta]%}> %{$reset_color%}"
RPROMPT="%{$fg[green]%}\$(current_branch) %{$fg[red]%}%~ %{$fg[yellow]%}%n%{$reset_color%} %{$fg[blue]%}%m%{$reset_color%}"

export VIM_APP_DIR="$HOME/Applications"
