if has rbenv; then
  # Fix rbenv installation for older ruby versions
  export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
  eval "$(rbenv init - --no-rehash)"
  push $HOME/.rbenv/shims
fi
