if [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/lib"
  export CPATH="$CPATH:/opt/homebrew/include"
  export C_INCLUDE_PATH="$C_INCLUDE_PATH:/opt/homebrew/include"
fi

if [ -d /home/linuxbrew/.linuxbrew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
