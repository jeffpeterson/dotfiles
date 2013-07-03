# export CURL_CA_BUNDLE='/System/Library/OpenSSL/certs/cert.pem'
# export SSL_CERT_FILE='/System/Library/OpenSSL/certs/cert.pem'

export PATH=$HOME/.rbenv/bin:$PATH

#if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
