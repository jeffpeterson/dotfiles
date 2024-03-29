export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export NODE_ENV=development

export NVM_DIR="$HOME/.nvm"

push $HOME/.npm-global/bin

nvm() {
  # nvm is simply too slow to init it for every shell
  # Run it once to introduce its effects

  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

  # Try homebrew first
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" || \
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm $*
}

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
