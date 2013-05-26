ZSH=$HOME/.oh-my-zsh


autoload -U colors && colors
autoload -U compinit
compinit
zstyle ':completion:*' menu select

# alias ls="ls -G"
alias n=note


COMPLETION_WAITING_DOTS="true"

plugins=(git rails3 ruby coffee osx gem heroku lein pow powder rvm python github brew clouapp rspec)

source $ZSH/oh-my-zsh.sh
source "$HOME/.wrappers"

export PATH="$HOME/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
export CDPATH="$HOME/code:$CDPATH"
export VISUAL=vim
export EDITOR=vim

# RPROMPT="%{$fg[black]$bg[red]%} %n %{$bg[blue]%} %m %{$fg[black]%} %{$bg[yellow]%} %? %{$fg[black]%}%{$reset_color%}"
# PROMPT="%{$bg[magenta]$fg[black]%} %2~ %{$bg[black]%}%{$fg[blue]%}%{$reset_color%} "
PROMPT="%{$fg[magenta]%}> %{$reset_color%}"
RPROMPT="%{$fg[red]%}%2~ %{$fg[yellow]%}%n%{$reset_color%} %{$fg[blue]%}%m%{$reset_color%}"

# export C_INCLUDE_PATH="$C_INCLUDE_PATH:$HOME/code/class/cs2240"
export VIM_APP_DIR="$HOME/Applications"
