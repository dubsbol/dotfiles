#!/bin/sh

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  artist=$(playerctl -p spotify metadata artist)
  album=$(playerctl -p spotify metadata album)
  title=$(playerctl -p spotify metadata title)
  icon="◼"

  if playerctl -p spotify status | grep "Playing" >/dev/null;
  then
      icon="▶"
  fi

  echo "$artist - $title <$icon>"
}

main "$@"
