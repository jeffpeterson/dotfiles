GOADD=$HOME/code/go/projects

PYTHONADD=/usr/local/lib/python2.7/site-packages

NODEADD='/usr/local/lib/node_modules'

PADD=$PADD:$HOME/code/flutter/bin

export PATH="$PADD:$PATH"
export     GOPATH="$GOADD:$GOPATH"
export PYTHONPATH="$PYTHONADD:$PYTHONPATH"
export  NODE_PATH="$NODEADD:$NODE_PATH"
export  ATOM_PATH="$HOME/Applications"
export   NODE_ENV=development

# export CPPFLAGS=-I/usr/local/opt/openssl/include
# export LDFLAGS=-L/usr/local/opt/openssl/lib

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
