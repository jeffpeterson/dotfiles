# Fix rbenv installation for older ruby versions
export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC

if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

push $HOME/.rbenv/shims
