if [ "$TERM" = "linux" ]; then
  echo -en "\e]P07A8478" # black
  echo -en "\e]P8859289" # darkgrey
  echo -en "\e]P1E67E80" # darkred
  echo -en "\e]P9E67E80" # red
  echo -en "\e]P2A7C080" # darkgreen
  echo -en "\e]PAA7C080" # green
  echo -en "\e]P3DBBC7F" # brown
  echo -en "\e]PBDBBC7F" # yellow
  echo -en "\e]P47FBBB3" # darkblue
  echo -en "\e]PC7FBBB3" # blue
  echo -en "\e]P5D699B6" # darkmagenta
  echo -en "\e]PDD699B6" # magenta
  echo -en "\e]P683C092" # darkcyan
  echo -en "\e]PE83C092" # cyan
  echo -en "\e]P7D3C6AA" # lightgrey
  echo -en "\e]PFD3C6AA" # white
  clear # for background artifacting
fi
