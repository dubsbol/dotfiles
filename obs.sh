#!/bin/sh

main() {
  if ! pgrep -x obs >/dev/null; then
    exit
  fi

  icon="○"

  if lsof -c obs-studio +D ~/Videos/ | grep "obs">/dev/null;
  then
      icon="●"
  fi

  echo "$icon"
}

main "$@"
