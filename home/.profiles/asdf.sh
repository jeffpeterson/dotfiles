if [ -d $HOMEBREW_PREFIX/opt/asdf ]; then
  # Fix rbenv installation for older ruby versions
  export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
  . $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
fi
