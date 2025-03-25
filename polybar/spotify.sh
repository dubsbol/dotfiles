#!/bin/sh

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  artist=$(playerctl -p spotify metadata artist)
  album=$(playerctl -p spotify metadata album)
  title=$(playerctl -p spotify metadata title)
  level=$(playerctl -p spotify volume | head -c 4)
  icon="◼"

  if playerctl -p spotify status | grep "Playing" >/dev/null;
  then
      icon="▶"
  fi

  echo "$artist - $title <$icon> <$level>"
}

main "$@"
