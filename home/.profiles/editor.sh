if has nvim; then
  export EDITOR=nvim
  export VISUAL=nvim
elif has code; then
  export EDITOR=code
  export VISUAL=code
elif has vim; then
  export EDITOR=vim
elif has vi; then
  export EDITOR=vi
fi
