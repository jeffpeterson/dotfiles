PADD=$HOME/bin
PADD=$PADD:$HOME/.rbenv/bin
PADD=$PADD:/usr/local/bin
PADD=$PADD:/usr/local/sbin
PADD=$PADD:/usr/local/heroku/bin
PADD=$PADD:/usr/local/share/npm/bin
PADD=$PADD:$HOME/code/go/projects/bin
PADD=$PADD:$HOME/code/arcanist/bin

export   PATH=$PADD:$PATH
export GOPATH=$HOME/code/go/projects

if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
