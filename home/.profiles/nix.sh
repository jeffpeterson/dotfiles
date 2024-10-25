if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
. $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# Load nix:
# [-e /etc/static/zshrc] && . /etc/static/zshrc

# Load direnv
# NOTE: Replaced with `autoenv`
which direnv > /dev/null && eval "$(direnv hook zsh)" #|| echo "Install direnv"
