#!/bin/sh

main() {
  if ! xwininfo -tree -root | grep "Sharing Indicator" > /dev/null && ! pgrep -x obs > /dev/null; then
    exit
  fi

  icon="○"

  if xwininfo -tree -root | grep "Sharing Indicator" > /dev/null || lsof -c obs-studio +D ~/Videos/ | grep "obs" > /dev/null; then
    oddseconds=$((`date +%s` % 2))
    case $oddseconds in
      0) icon="◉" ;;
      1) icon="●" ;;
    esac
  fi

  echo "$icon"
}

main "$@"
