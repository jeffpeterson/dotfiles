# Fix rbenv installation for older ruby versions
export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC

. /opt/homebrew/opt/asdf/libexec/asdf.sh
