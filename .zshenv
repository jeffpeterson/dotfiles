PADD=$HOME/bin
PADD=$PADD:$HOME/.rbenv/bin
PADD=$PADD:/usr/local/bin
PADD=$PADD:/usr/local/sbin
PADD=$PADD:/usr/local/heroku/bin
PADD=$PADD:/usr/local/share/npm/bin
PADD=$PADD:$HOME/code/go/projects/bin
PADD=$PADD:$HOME/code/arcanist/bin

GOADD=$HOME/code/go/projects

PYTHONADD=/usr/local/lib/python2.7/site-packages

NODEADD='/usr/local/lib/node_modules'

export       PATH="$PADD:$PATH"
export     GOPATH="$GOADD:$GOPATH"
export PYTHONPATH="$PYTHONADD:$PYTHONPATH"
export  NODE_PATH="$NODEADD:$NODE_PATH"
export  ATOM_PATH="$HOME/Applications/Atom.app"

if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
