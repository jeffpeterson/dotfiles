source ~/.rootenv

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt appendhistory

setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY_TIME
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt PROMPT_CR
setopt PROMPT_SP
setopt PROMPT_SUBST

setopt noautocd
unsetopt AUTO_CD
bindkey -e

# starts zsh autocompletion. must be after homebrew adds completions
autoload -Uz compinit && compinit -u # FIXME: -u ignores insecure
zstyle ':completion:*' menu select

autoload -U colors && colors
typeset -F SECONDS=0;

local timer=$SECONDS

preexec() {
  timer=$SECONDS
}

precmd() {
  timer_difference=$(($SECONDS - $timer))
  timer=$SECONDS
}

elapsed() {
  printf '%.2fs' $timer_difference
}

current_branch() {
  git branchname 2>/dev/null || git commitname 2>/dev/null
}

PROMPT="
%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%{$fg[magenta]%}%~%{$reset_color%} * %{$fg[green]%}\$(current_branch) %{$reset_color%}\$(elapsed) %(?..%{$fg[red]%})(exit %?)
%{$fg[magenta]%}>%{$reset_color%} "

which starship >/dev/null && eval "$(starship init zsh)"

[ -s ~/.iterm2_shell_integration.zsh ] && . ~/.iterm2_shell_integration.zsh

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

# opam configuration
# test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Added by LM Studio CLI (lms)

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

